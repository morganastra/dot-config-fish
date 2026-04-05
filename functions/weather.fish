function weather --description 'Show weather forecast for a city'
    set -l city "Oakland"

    argparse 'd/debug' 'n/days=' -- $argv
    or return

    if set -ql _flag_days
        set forecast_days $_flag_days
    else
        set forecast_days 3
    end

    if test -n "$argv"
        set city "$argv"
    end

    set -l geo_response (curl -sG "https://geocoding-api.open-meteo.com/v1/search" \
        --data-urlencode "name=$city" \
        --data-urlencode "count=1" \
        --data-urlencode "language=en" \
        --data-urlencode "format=json")

    if set -ql _flag_debug
        echo "=== Geocoding Response ==="
        echo $geo_response
        echo ""
    end

    set -l lat (echo $geo_response | jq -r '.results[0].latitude')
    set -l lon (echo $geo_response | jq -r '.results[0].longitude')
    set -l city_name (echo $geo_response | jq -r '.results[0].name')

    if test -z "$lat" -o "$lat" = "null"
        echo "Could not find city: $city"
        return 1
    end

    set -l forecast (curl -sG "https://api.open-meteo.com/v1/forecast" \
        --data-urlencode "latitude=$lat" \
        --data-urlencode "longitude=$lon" \
        --data-urlencode "daily=weathercode,temperature_2m_max,temperature_2m_min,precipitation_sum" \
        --data-urlencode "timezone=auto" \
        --data-urlencode "forecast_days=$forecast_days")

    if set -ql _flag_debug
        echo "=== Forecast Response ==="
        echo $forecast
        echo ""
    end

    set -l header "Weather for $city_name (next $forecast_days days)"
    set -l separator (string repeat -n (string length $header) -- "=")
    echo $header
    echo $separator

    for i in (seq 0 (math $forecast_days - 1))
        set -l date (echo $forecast | jq -r ".daily.time[$i]")
        set -l code (echo $forecast | jq -r ".daily.weathercode[$i]")
        set -l max_temp (echo $forecast | jq -r ".daily.temperature_2m_max[$i]")
        set -l min_temp (echo $forecast | jq -r ".daily.temperature_2m_min[$i]")
        set -l precip (echo $forecast | jq -r ".daily.precipitation_sum[$i]")

        set -l condition "Unknown"
        switch $code
            case 0 1
                set condition "☀️ Clear sky"
            case 2 3
                set condition "⛅ Partly cloudy"
            case 45 48
                set condition "🌫️ Foggy"
            case 51 53 55
                set condition "🌧️ Drizzle"
            case 56 57
                set condition "🌧️ Freezing Drizzle"
            case 61 63 65
                set condition "🌧️ Rain"
            case 66 67
                set condition "🌧️ Freezing Rain"
            case 71 73 75 77 85 86
                set condition "❄️ Snow"
            case 80 81 82
                set condition "🌦️ Rain showers"
            case 95
                set condition "⛈️ Thunderstorm"
            case 96 99
                set condition "⛈️ Thunderstorm with hail"
        end

        set -l date_short (string sub -s 1 -l 10 $date)
        echo "$date_short: $condition, $min_temp°C / $max_temp°C, precipitation: $precip mm"
    end
end
