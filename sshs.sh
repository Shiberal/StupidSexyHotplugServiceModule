#!/system/bin/sh
 while :
 do
 A0=( $(sed '2q;d' /proc/stat) ) 
 B0=$(expr "${A0[1]}" + "${A0[2]}" + "${A0[3]}" + "${A0[4]}")
 sleep 0.2
 C0=( $(sed '2q;d' /proc/stat) )
 D0=$(expr "${C0[1]}" + "${C0[2]}" + "${C0[3]}" + "${C0[4]}")
 let E0=$(((100 * (B0 - D0 - ${A0[4]} + ${C0[4]})) / (B0 - D0)))

 cA3=$(cat /sys/devices/system/cpu/cpu3/online)
 clear
 if (("$E0" < "30")) #SHUT DOWN SOME Small CORES
 then
 echo 0 > /sys/devices/system/cpu/cpu2/online
 echo 0 > /sys/devices/system/cpu/cpu3/online
 fi


 if (("$E0" >= "50")) #TURN ON THIS Small CORE PARTY
 then
 echo 1 > /sys/devices/system/cpu/cpu2/online
 echo 1 > /sys/devices/system/cpu/cpu3/online
 fi

 if (("$E0" < "50")) #SHUT DOWN SOME BIG CORES
 then
 echo 0 > /sys/devices/system/cpu/cpu5/online
 echo 0 > /sys/devices/system/cpu/cpu6/online
 echo 0 > /sys/devices/system/cpu/cpu7/online
 fi

 if (("$E0" >= "90")) #TURN ON THIS BIG CORE PARTY
 then
 echo 1 > /sys/devices/system/cpu/cpu5/online
 echo 1 > /sys/devices/system/cpu/cpu6/online
 echo 1 > /sys/devices/system/cpu/cpu7/online
 fi
 sleep 0.8
 done



# This script will be executed in late_start service mode
# More info in the main Magisk thread
