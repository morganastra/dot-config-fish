function isword
	set word \^$argv\$
	grep $word /usr/share/dict/words
end
