function time_appropriate_greeting
	set current_hour (date +%H)
switch $current_hour
case 01 02 03 04 05
echo "oh dear, is it awfully early or awfully late?"
case 06 07
echo "bright and early!"
case 08 09 10 11
echo "good morning!"
case 12 13 14 15 16
echo "good afternoon!"
case 17 18 19 20 21
echo "good evening!"
case 22 23 00
echo "good night!"
end
end
