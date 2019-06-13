# Defined in /tmp/fish.lXG6vC/natural-scrolling-enable.fish @ line 2
function natural-scrolling-enable
	xinput list | grep -v Virtual | grep "id=" | grep pointer | cut -f2 | cut -d= -f2 | xargs -I% xinput set-prop % 289 1 | true
	xinput list | grep -v Virtual | grep "id=" | grep pointer | cut -f2 | cut -d= -f2 | xargs xinput list-props | grep 289
end
