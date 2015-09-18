function m
    set m_files (find $argv -type f | egrep -i '.*\.(flac|alac|aac|ogg|mp3|m4a)$' | sort )
    mplayer $m_files
end
