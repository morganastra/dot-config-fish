function wttr --description 'Get weather from wttr.in'
    if set -q argv[1]
        set -l location (string join '+' -- $argv | string replace -a ' ' '+')
        curl -s "https://wttr.in/$location?m"
    else
        curl -s "https://wttr.in?m"
    end
end
