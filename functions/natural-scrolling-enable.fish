# Defined in - @ line 2
function natural-scrolling-enable
	xinput list | grep -v Virtual | grep "id=" | grep pointer | cut -f2 | cut -d= -f2 | xargs -I% xinput set-prop % "libinput Natural Scrolling Enabled" 1 | true
    xinput list | grep -v Virtual | grep "id=" | grep pointer | cut -f2 | cut -d= -f2 | xargs xinput list-props | grep "libinput Natural Scrolling Enabled"
end
