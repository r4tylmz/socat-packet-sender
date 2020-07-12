

CURRENTDATE=`date`
i=1
socat tcp4-l:20002,fork STDOUT |
    while read -r line
    do
        echo "$i- TCP--> $line {$CURRENTDATE}" >> tcplog.txt
        ((i++))
    done
