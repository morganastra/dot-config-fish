function uri-to-path
    python3 -c "from urllib.parse import urlparse, unquote; import sys; print(unquote(urlparse(sys.argv[1]).path))" $argv
end
