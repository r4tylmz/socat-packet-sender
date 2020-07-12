
CURRENTDATE=`date`
fork_udp(){
    i=1
    socat -d -d UDP4-LISTEN:5001,fork STDOUT |
    while read -r line
    do
        MSG="$(echo "$line" | grep -P -o -e "(?:msg:')(.*?)(?:')" | grep -Po "(?<=')[^']+(?=')" )"
        ID="$(echo "$line" | grep -P -o -e "(?:no:')(.*?)(?:')" | grep -Po "(?<=')[^']+(?=')" )"
        DATE="$(echo "$line" | grep -P -o -e "(?:timestamp:')(.*?)(?:')" | grep -Po "(?<=')[^']+(?=')" )"
        echo "$i- ROUTER-->UDP4: [{$MSG} {$ID} {$DATE}] {$CURRENTDATE}" >> route.txt
        echo "[{$MSG} {$ID} {$DATE}]" | socat - UDP4-DATAGRAM:localhost:10001
        ((i++))
    done
}

fork_tcp(){
    j=1
    socat tcp4-l:5001,fork STDOUT |
        while read -r line
        do
            MSG="$(echo "$line" | grep -P -o -e "(?:msg:')(.*?)(?:')" | grep -Po "(?<=')[^']+(?=')")"
            ID="$(echo "$line" | grep -P -o -e "(?:no:')(.*?)(?:')" | grep -Po "(?<=')[^']+(?=')")"
            DATE="$(echo "$line" | grep -P -o -e "(?:timestamp:')(.*?)(?:')" | grep -Po "(?<=')[^']+(?=')" )"
            echo "$j- ROUTER-->TCP4: [{$MSG} {$ID} {$DATE}] {$CURRENTDATE}" >> route.txt
            echo "[{$MSG} {$ID} {$DATE}]" | socat - TCP4:localhost:20002
            ((j++))
        done
}

fork_udp & fork_tcp

