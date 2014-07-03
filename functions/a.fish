function a
	if hash ag 2>/dev/null
ag $argv;
else if hash ack 2>/dev/null
ack $argv;
else
echo "Install ag or ack" 1>&2
exit 1
end
end
