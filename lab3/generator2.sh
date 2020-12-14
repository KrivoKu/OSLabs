while true; do
	read line;
	case "$line" in
		TERM)
			kill -SIGTERM $1
			exit 0
		;;
		*)
			kill -USR2 $1
		;;
		+)
			kill -USR1 $1
		;;
	esac
done
