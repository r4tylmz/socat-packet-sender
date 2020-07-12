# Example of sending packages via Socat



## Socat Installation to Unix based systems

```bash
sudo apt-get update -y
sudo apt-get install -y socat
```

## Socat Installation to Windows

```
https://sourceforge.net/projects/unix-utils/files/socat/1.7.3.2/
```

## Basic Socat Usages

```
https://github.com/craSH/socat/blob/master/EXAMPLES
```



![](https://i.imgur.com/TtBIhdq.png)

**Packets must be like this**

```
{id:'YOUR_ID', no:'PACKET_NUMBER' msg:'PACKET FROM CLIENT', timestamp:'DATETIME'}  
```

**A1 is a client. It runs client.sh. It creates 10 UDP4 and 10 TCP4 packets then if the packet is a udp4 packet, it sends to UDP4:localhost:5001 port. if the packet is a tcp4 packet, it sends to TCP4:localhost:5001 port. After sending packets it logs each of them to client.txt line by line.**

**Client.txt must be like this**

```
CLIENT-->{PROTOCOL}: {MSG}{PACKET_NUMBER}{DATETIME} 
```

**A2 is a router. It runs route.sh. It listens on UDP4:5001 and TCP4:5001 ports. If incoming packet is a TCP4 packet, it sends to TCP4:20002 port.  If incoming packet is a UDP4 packet, it sends to UDP4:10001 port then it logs each of incoming packet to route.txt line by line.**

**Route.txt must be like this**

```
ROUTER-->PROTOCOL: [{MSG}{PACKET_NUMBER}{DATETIME}] {CURRENT_DATETIME} 
```

**A3 is a UDP4 server. It runs udpserver.sh. It listens on UDP4:10001 port and writes each of incoming packet to udplog.txt line by line.**

**Udplog.txt must be like this**

```
UDP--> [{MSG}{PACKET_NUMBER}{DATETIME}] {CURRENT_DATETIME} 
```

**A4 is a TCP4 server. It runs tcpserver.sh. It listens on TCP4:20002 port and writes each of incoming packet to tcplog.txt line by line.**

**Udplog.txt must be like this**

```
TCP--> [{MSG}{PACKET_NUMBER}{DATETIME}] {CURRENT_DATETIME} 
```



#### **Restrictions**

- **If there is no txt file, it will be created and overwritten if any. New log values will be written with each transaction.**
- **The symbols {,}, [,] in all messages will be preserved.**

