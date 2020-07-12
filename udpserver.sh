# A3: UDP4 sunucu. udpserver.sh (ya da udpserver.bat) dosyasını çalıştıracaktır. UDP4:10001 portunu
# dinleyecek ve gelen mesajı udplog.txt dosyasına kaydedecektir. udplog.txt dosyasına gelen her mesaj
# ayrı satırlarda olmak üzere:
# UDP--> [{mesaj}{ID}{datetime}] {datetime}şeklinde yazılması beklenmektedir. Buradaki mesaj, ID ve ilk
# datetime parametresi A1’den A2 bilgisayarına gelen mesajın içeriğidir. İkinci datetime ise A3
# bilgisayarının mesajı aldığı andaki datetime değeri olacaktır.
CURRENTDATE=`date`
i=1
socat udp4-listen:10001,fork stdout |
    while read -r line
    do
        echo "$i- UDP--> $line {$CURRENTDATE}" >> udplog.txt
        ((i++))
    done