
CURRENTDATE=`date`
i=1
socat udp4-listen:10001,fork stdout |
    while read -r line
    do
        echo "$i- UDP--> $line {$CURRENTDATE}" >> udplog.txt
        ((i++))
    done
