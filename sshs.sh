#!/system/bin/sh
 while :
 do
    #RETRIVE CORE ACTIVITY
    CA1=$(cat /sys/devices/system/cpu/cpu1/online)
    CA2=$(cat /sys/devices/system/cpu/cpu2/online)
    CA3=$(cat /sys/devices/system/cpu/cpu3/online)
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


#SWITCHES -------------------LET START---------------------- SWITCHES
    #SMALL CLUSTER
    
    if [[ $E0 -gt 50 ]] #C1 ON
    then
        echo 1 > /sys/devices/system/cpu/cpu1/online

    else

        if [[ $E1 -lt 20 ]] #C1 OFF
        then
            echo 0 > /sys/devices/system/cpu/cpu1/online
        fi

    fi
    if [[ $E1 -gt 50 ]] #C1 ON
    then
        echo 1 > /sys/devices/system/cpu/cpu2/online

    else

        if [[ $E2 -lt 20 ]] #C1 OFF
        then
            echo 0 > /sys/devices/system/cpu/cpu2/online
        fi

    fi
    if [[ $E2 -gt 50 ]] #C1 ON
    then
        echo 1 > /sys/devices/system/cpu/cpu3/online

    else

        if [[ $E3 -lt 20 ]] #C1 OFF
        then
            echo 0 > /sys/devices/system/cpu/cpu3/online
        fi

    fi



    
    #SMALL CLUSTER


    if [[ $E4 -gt 50 ]] #C1 ON
    then
        echo 1 > /sys/devices/system/cpu/cpu5/online

    else

        if [[ $E5 -lt 20 ]] #C1 OFF
        then
            echo 0 > /sys/devices/system/cpu/cpu5/online
        fi

    fi
    if [[ $E5 -gt 50 ]] #C1 ON
    then
        echo 1 > /sys/devices/system/cpu/cpu6/online

    else

        if [[ $E6 -lt 20 ]] #C1 OFF
        then
            echo 0 > /sys/devices/system/cpu/cpu6/online
        fi

    fi
    if [[ $E6 -gt 50 ]] #C1 ON
    then
        echo 1 > /sys/devices/system/cpu/cpu7/online

    else

        if [[ $E7 -lt 20 ]] #C1 OFF
        then
            echo 0 > /sys/devices/system/cpu/cpu7/online
        fi

    fi









    #BIG CLUSTER
    #BIG CLUSTER

    




    sleep 0.4
 done