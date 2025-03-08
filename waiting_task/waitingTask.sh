#!/bin/bash
#Clear Current line
clear_line(){

echo -ne "\033[2K\r"

}

#Iterate through single Array 
cursor_position(){

	cursor_pos=("  |  " " / " " -- " " \\  " )
	clear_line
	echo -n ${cursor_pos[$1]} " " 

}

dummy_task(){
	
	echo "Waiting for " $1 " Seconds"
	sleep $1

}


dummy_task 5 &  p_id=$!
echo "Pid : " $p_id

incr=0
while ps -p $p_id > /dev/null
do
	incr=$(($incr + 1))
	len_1=$((${#incr} - 1))
	last=${incr:$len_1:1}
	#Variable tests
	#echo "Number" $incr
	#echo "Length" $len_1
	#echo "Last Digit " $last

	case $last in
		8|9)
		sleep 0
		;;
		*)
		sleep 0.1
		;;
	esac

	case $last in
		0|4)
			clear_line
			cursor_position 0
			;;
		1|5)
			clear_line
			cursor_position 1
			;;
		2|6)
			clear_line
			cursor_position 2
			;;
		3|7)
			clear_line
			cursor_position 3
			;;
	esac

done
clear_line

echo " "
echo "PID $p_id Finished"
