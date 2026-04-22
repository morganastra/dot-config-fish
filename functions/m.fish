function m
 # Play music from a given directory using an appropriate player

 set -l _flag_e # enqueue (only supported in audacious)
 set -l _flag_R # play in shuffled order

 argparse 'R/random-sort' 'e/enqueue' -- $argv
 or return

 if pgrep -x audacious >/dev/null
     audacious $_flag_e (findmusic $argv | sort $_flag_R)
 else
   mpv --no-video (findmusic $argv | sort $_flag_R)
 end
end
