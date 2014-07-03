function a
    if which ag >/dev/null
        ag $argv;
    else if which ack >/dev/null
        ack $argv;
    else
        echo "Install ag or ack" 1>&2
        return 1
    end
end
