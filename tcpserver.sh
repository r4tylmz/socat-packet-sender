# A4: TCP4 sunucu. tcpserver.sh (ya da tcpserver.bat) dosyasını çalıştıracaktır. TCP4:20002 portunu
# dinleyecek ve gelen mesajı tcplog.txt dosyasına kaydedecektir. tcplog.txt dosyasına gelen her mesaj
# ayrı satırlarda olmak üzere:
# TCP--> [{mesaj}{ID}{datetime}] {datetime} şeklinde yazılması beklenmektedir. Buradaki mesaj, ID ve ilk
# datetime parametresi A1’den A2 bilgisayarına gelen mesajın içeriğidir. İkinci datetime ise A4
# bilgisayarının mesajı aldığı andaki datetime değeri olacaktır.

CURRENTDATE=`date`
i=1
socat tcp4-l:20002,fork STDOUT |
    while read -r line
    do
        echo "$i- TCP--> $line {$CURRENTDATE}" >> tcplog.txt
        ((i++))
    done