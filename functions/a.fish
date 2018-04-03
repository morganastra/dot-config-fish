# Defined in - @ line 2
function a
	if which rg >/dev/null
        rg $argv

    else if which ag >/dev/null
        ag $argv

    else if which ack >/dev/null
        ack $argv

    else
        echo "Install rg or ag or ack" 1>&2
        return 1
    end
end
