#!/bin/sh

interval=60

# total="$(free | awk '/Mem:/ {print $2}')"

while :
do
    # volume=$(amixer scontents | awk '/Left: Playback/ {print $5}' | sed 's/[][]//g; s/%//')
    #
    # cpu_value=$(grep -o "^[^ ]*" /proc/loadavg)
    # # memory
    # used="$(free | awk '/Mem:/ {print $3}')"
    # printf -v perc %d "$(( 100 * used /total))"
    # human="$(free -h | awk '/Mem:/ {print $3}' | sed 's/i//g')"
    # mem="$human($perc%)" 
    # # harddisk storage
    # free="$(df -h /home | awk '/dev/ {print $3}' | sed 's/G/Gb/')"
    # perc="$(df -h /home | awk '/dev/ {print $5}')"
    # hdd="$free($perc)"

    d=$(date "+%A %d %b %Y %R")

    # xsetroot -name "| vol: $volume% | cpu: $cpu_value% | mem: $mem | hdd: $hdd | $d"

    xsetroot -name "| $d |"

    sleep $interval

done
