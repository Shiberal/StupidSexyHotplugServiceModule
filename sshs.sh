#!/system/bin/sh
	while :
	do	
	c0=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)
	c4=$(cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_cur_freq)

	cA3=$(cat /sys/devices/system/cpu/cpu3/online)
	
	clear
	if (("$c0" < "1536000")) #SHUT DOWN SOME Small CORES
	then
	echo 0 > /sys/devices/system/cpu/cpu2/online
	echo 0 > /sys/devices/system/cpu/cpu3/online
	fi


	if (("$c0" >= "1843200")) #TURN ON THIS Small CORE PARTY
	then
	echo 1 > /sys/devices/system/cpu/cpu2/online
	echo 1 > /sys/devices/system/cpu/cpu3/online
	fi

	if (("$c4" < "1536000")) #SHUT DOWN SOME BIG CORES
	then
	echo 0 > /sys/devices/system/cpu/cpu5/online
	echo 0 > /sys/devices/system/cpu/cpu6/online
	echo 0 > /sys/devices/system/cpu/cpu7/online
	fi

	if (("$c4" >= "2150000" && cA3 != 0)) #TURN ON THIS BIG CORE PARTY
	then
	echo 1 > /sys/devices/system/cpu/cpu5/online
	echo 1 > /sys/devices/system/cpu/cpu6/online
	echo 1 > /sys/devices/system/cpu/cpu7/online
	fi
	
	sleep 1
	done



# This script will be executed in late_start service mode
# More info in the main Magisk thread
