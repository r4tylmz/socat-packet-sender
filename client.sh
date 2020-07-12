#!/bin/bash
DATETIME=`date`

for (( udp_counter=1; udp_counter<=10; udp_counter++ ))
do

    echo "{id:'your_id', no:'$udp_counter', msg:'packet from client', timestamp:'$DATETIME'}" | socat - UDP4-DATAGRAM:localhost:5001
    echo "$udp_counter- CLIENT-->{UDP4}: {packet from client} {$udp_counter} {$DATETIME}" >> client.txt
done


for (( tcp_counter=1; tcp_counter<=10; tcp_counter++ ))
do
    echo "{id:'your_id', no:'$tcp_counter', msg:'packet from client', timestamp:'$DATETIME'}" | socat - TCP4:localhost:5001
    echo "$tcp_counter- CLIENT-->{TCP4}: {packet from client} {$tcp_counter} {$DATETIME}" >> client.txt
done
