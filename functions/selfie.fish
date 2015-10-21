function selfie
	mplayer -quiet tv:// -tv device=/dev/video0 -fps 15 -vf screenshot
end
