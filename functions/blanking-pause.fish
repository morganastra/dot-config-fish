# Defined in /tmp/fish.I1pCm3/blanking-pause.fish @ line 2
function blanking-pause
  if count $argv > /dev/null
    sleep $argv[1] &
    set sleep_pid (jobs -lp | tail -n1) 
    echo "xscreensaver deactivated for "$argv[1]". Press ^c to resume."
    while jobs > /dev/null; and test $sleep_pid = (jobs -lp | tail -n1)
      xscreensaver-command -deactivate > /dev/null
      sleep 1m
    end
    echo "reactivating"
  else
    echo "xscreensaver deactivated indefinitely. Press ^c to resume."
    while true
      xscreensaver-command -deactivate > /dev/null
      sleep 1m
    end
  end
end
