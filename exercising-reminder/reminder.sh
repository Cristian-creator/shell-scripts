OPERATION_NOT_PERMITTED=1

display_error() {
  	echo "The script runs this way: $0 [5/10/30]"
	exit OPERATION_NOT_PERMITTED
}

if [ $# -ne 1 ]
	then
		display_error
else
	# used switch in order to validate the input
	# in another way, can be used a regular expression or an if statement with 3 comparisons
	choosed=0
	case $1 in
		5)
		 choosed=5
		;;
		10)
		 choosed=10
		;;
		30)
		 choosed=30
		;;
		*)
		  display_error
		;;
	esac

#	systemctl enable --now atd.service  -- run this if at service doesnt work

	at now + $choosed minutes -f warning-box.sh
	echo "$choosed minutes until exercising reminder. Stay healthy, my friend, $USER!"

	QUEUE_LENGTH=`atq | wc -l`
	echo "Current queue($QUEUE_LENGTH):"
	atq
fi
