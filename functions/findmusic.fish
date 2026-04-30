function findmusic
	# Edge case: when trying to find music across nested directories
	# where some contain .cue files and others do not, only .cue files
	# will be returned.
	# find $argv -type f | grep -E -i '.*\.cue$'; or \
	find $argv -type f | grep -E -i '.*\.(cue|ape|flac|aiff|mp4|webm|mkv|alac|aac|ogg|mp3|m4a)$'
end
