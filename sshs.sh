MODDIR=${0%/*}
MODID=stupidsexyhotplugservice
MODPATH=/data/adb/modules/stupidsexyhotplugservice
INFO=/data/adb/modules/.stupidsexyhotplugservice-files
LIBDIR=/system

C1U=( $(grep C1U profile.sshs) )
C1D=( $(grep C1D profile.sshs) )
C2U=( $(grep C2U profile.sshs) )
C2D=( $(grep C2D profile.sshs) )
C3U=( $(grep C3U profile.sshs) )
C3D=( $(grep C3D profile.sshs) )
C4U=( $(grep C4U profile.sshs) )
C4D=( $(grep C4D profile.sshs) )
C5U=( $(grep C5U profile.sshs) )
C5D=( $(grep C5D profile.sshs) )
C6U=( $(grep C6U profile.sshs) )
C6D=( $(grep C6D profile.sshs) )
C7U=( $(grep C7U profile.sshs) )
C7D=( $(grep C7D profile.sshs) )

R1=0
R2=0
R3=0
R4=0
R5=0
R6=0
R7=0

 while :
 do
	chmod -R 777 /sys/devices/system/cpu/
    #RETRIVE CORE ACTIVITY
    CA1=$(cat /sys/devices/system/cpu/cpu1/online)
    CA2=$(cat /sys/devices/system/cpu/cpu2/online)
    CA3=$(cat /sys/devices/system/cpu/cpu3/online)
    CA4=$(cat /sys/devices/system/cpu/cpu4/online)
    CA5=$(cat /sys/devices/system/cpu/cpu5/online)
    CA6=$(cat /sys/devices/system/cpu/cpu6/online)
    CA7=$(cat /sys/devices/system/cpu/cpu7/online)
    A0=( $(grep cpu0 /proc/stat) ) #L0
    A1=( $(grep cpu1 /proc/stat) ) #L1
    A2=( $(grep cpu2 /proc/stat) ) #L2
    A3=( $(grep cpu3 /proc/stat) ) #L3
    A4=( $(grep cpu4 /proc/stat) ) #B0
    A5=( $(grep cpu5 /proc/stat) ) #B1
    A6=( $(grep cpu6 /proc/stat) ) #B2
    A7=( $(grep cpu7 /proc/stat) ) #B3
    #BORING MATH INCOMING
    #LITTLE
    B0=$(expr "${A0[1]}" + "${A0[2]}" + "${A0[3]}" + "${A0[4]}")  # NO NEED TO CHECK CORE 0 ACTIVATION
    if (("$CA1" > "0"))
    then
    B1=$(expr "${A1[1]}" + "${A1[2]}" + "${A1[3]}" + "${A1[4]}")
    fi
    if (("$CA2" > "0"))
    then
    B2=$(expr "${A2[1]}" + "${A2[2]}" + "${A2[3]}" + "${A2[4]}")
    fi
    if (("$CA3" > "0"))
    then
    B3=$(expr "${A3[1]}" + "${A3[2]}" + "${A3[3]}" + "${A3[4]}")
    fi
    #BIG
    B4=$(expr "${A4[1]}" + "${A4[2]}" + "${A4[3]}" + "${A4[4]}")  #NO NEED TO CHECK CORE 4 ACTIVATION
    if (("$CA5" > "0"))
    then
    B5=$(expr "${A5[1]}" + "${A5[2]}" + "${A5[3]}" + "${A5[4]}")
    fi 
    if (("$CA6" > "0"))
    then
    B6=$(expr "${A6[1]}" + "${A6[2]}" + "${A6[3]}" + "${A6[4]}")
    fi 
    if (("$CA7" > "0"))
    then
    B7=$(expr "${A7[1]}" + "${A7[2]}" + "${A7[3]}" + "${A7[4]}")
    fi
     sleep 0.2
    C0=( $(grep cpu0 /proc/stat) ) #L0
    C1=( $(grep cpu1 /proc/stat) ) #L1
    C2=( $(grep cpu2 /proc/stat) ) #L2
    C3=( $(grep cpu3 /proc/stat) ) #L3
    C4=( $(grep cpu4 /proc/stat) ) #B0
    C5=( $(grep cpu5 /proc/stat) ) #B1
    C6=( $(grep cpu6 /proc/stat) ) #B2
    C7=( $(grep cpu7 /proc/stat) ) #B3
    D0=$(expr "${C0[1]}" + "${C0[2]}" + "${C0[3]}" + "${C0[4]}")
    let E0=$(((100 * ($B0 - $D0 - ${A0[4]} + ${C0[4]})) / ($B0 - $D0)))  # NO NEED TO CHECK CORE 0 ACTIVATION
    if (("$CA1" > "0"))
    then
        D1=$(expr "${C1[1]}" + "${C1[2]}" + "${C1[3]}" + "${C1[4]}")
        let E1=$(((100 * ($B1 - $D1 - ${A1[4]} + ${C1[4]})) / ($B1 - $D1)))
    fi
    if (("$CA2" > "0"))
    then
        D2=$(expr "${C2[1]}" + "${C2[2]}" + "${C2[3]}" + "${C2[4]}")
        let E2=$(((100 * ($B2 - $D2 - ${A2[4]} + ${C2[4]})) / ($B2 - $D2)))
    fi
    if (("$CA3" > "0"))
    then
        D3=$(expr "${C3[1]}" + "${C3[2]}" + "${C3[3]}" + "${C3[4]}")
        let E3=$(((100 * ($B3 - $D3 - ${A3[4]} + ${C3[4]})) / ($B3 - $D3)))
    fi
    #BIG
    D4=$(expr "${C4[1]}" + "${C4[2]}" + "${C4[3]}" + "${C4[4]}")
    let E4=$(((100 * ($B4 - $D4 - ${A4[4]} + ${C4[4]})) / ($B4 - $D4))) #NO NEED TO CHECK CORE 4 ACTIVATION
    if (("$CA5" > "0"))
    then
    D5=$(expr "${C5[1]}" + "${C5[2]}" + "${C5[3]}" + "${C5[4]}")
    let E5=$(((100 * ($B5 - $D5 - ${A5[4]} + ${C5[4]})) / ($B5 - $D5)))
    fi 
    if (("$CA6" > "0"))
    then
    D6=$(expr "${C6[1]}" + "${C6[2]}" + "${C6[3]}" + "${C6[4]}")
    let E6=$(((100 * ($B6 - $D6 - ${A6[4]} + ${C6[4]})) / ($B6 - $D6)))
    fi 
    if (("$CA7" > "0"))
    then
    D7=$(expr "${C7[1]}" + "${C7[2]}" + "${C7[3]}" + "${C7[4]}")
    let E7=$(((100 * ($B7 - $D7 - ${A7[4]} + ${C7[4]})) / ($B7 - $D7)))
    fi
    #RETRIVE CORE ACTIVITY
    










    if [[ $E0 -gt ${C1U[1]} ]] #C1 ON
    then
        R1=1
    else
        if [[ $E1 -lt ${C1D[1]} ]] #C1 OFF
        then
            R1=0
        fi
    fi
    if [[ $E1 -gt ${C2U[1]} ]] #C1 ON
    then
        R2=1
    else
        if [[ $E2 -lt ${C2D[1]} ]] #C1 OFF
        then
            R2=0
        fi
    fi
    if [[ $E2 -gt ${C3U[1]} ]] #C1 ON
    then
        R3=1
    else
        if [[ $E3 -lt ${C3D[1]} ]] #C1 OFF
        then
            R3=0
        fi
    fi
	if [[ $E3 -gt ${C4U[1]} ]] #C1 ON
    then
        R4=1
    else
        if [[ $E4 -lt ${C4D[1]} ]] #C1 OFF
        then
            R4=0
        fi
    fi

    if [[ $E4 -gt ${C5U[1]} ]] #C1 ON
    then
        R5=1
    else
        if [[ $E5 -lt ${C5D[1]} ]] #C1 OFF
        then
            R5=0
        fi
    fi
    if [[ $E5 -gt ${C6U[1]} ]] #C1 ON
    then
        R6=1
    else
        if [[ $E6 -lt ${C6D[1]} ]] #C1 OFF
        then
            R6=0
        fi
    fi
    if [[ $E6 -gt ${C7U[1]} ]] #C1 ON
    then
        R7=1
    else
        if [[ $E7 -lt ${C7D[1]} ]] #C1 OFF
        then
            R7=0
        fi
    fi
    





    #WRITE CORES
    echo $R1 > /sys/devices/system/cpu/cpu1/online
    echo $R2 > /sys/devices/system/cpu/cpu2/online
    echo $R3 > /sys/devices/system/cpu/cpu3/online
    echo $R4 > /sys/devices/system/cpu/cpu4/online
    echo $R5 > /sys/devices/system/cpu/cpu5/online
    echo $R6 > /sys/devices/system/cpu/cpu6/online
    echo $R7 > /sys/devices/system/cpu/cpu7/online
    #WRITE CORES

 sleep 1
 done

