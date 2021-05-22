
display_error() {
  	echo "Scriptul se executa astfel: $0 [5 / 10 / 30]"
	exit 1
}

if [ $# -ne 1 ]
	then
		display_error
else
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

	echo "$choosed minutes until exercising reminder"

#	systemctl enable --now atd.service  -- if at service doesnt work

	at now + $choosed minutes -f warning-box.sh
fi
