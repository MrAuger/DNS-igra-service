[airdrop@aorus-pro-ac ~]$ nmcli dev status
DEVICE          TYPE      STATE                   CONNECTION
wlp6s0          wifi      connected               5G
lo              loopback  connected (externally)  lo
docker0         bridge    connected (externally)  docker0
p2p-dev-wlp6s0  wifi-p2p  disconnected            --
eno1            ethernet  unavailable             --
[airdrop@aorus-pro-ac ~]$
[airdrop@aorus-pro-ac ~]$
[airdrop@aorus-pro-ac ~]$ nmcli dev show p2p-dev-wlp6s0
GENERAL.DEVICE:                         p2p-dev-wlp6s0
GENERAL.TYPE:                           wifi-p2p
GENERAL.HWADDR:                         (unknown)
GENERAL.MTU:                            0
GENERAL.STATE:                          30 (disconnected)
GENERAL.CONNECTION:                     --
GENERAL.CON-PATH:                       --
[airdrop@aorus-pro-ac ~]$ nmcli dev show wlp6s0
GENERAL.DEVICE:                         wlp6s0
GENERAL.TYPE:                           wifi
GENERAL.HWADDR:                         00:E9:3A:9B:93:AF
GENERAL.MTU:                            1500
GENERAL.STATE:                          100 (connected)
GENERAL.CONNECTION:                     5G
GENERAL.CON-PATH:                       /org/freedesktop/NetworkManager/ActiveConnection/9
IP4.ADDRESS[1]:                         192.168.1.20/24
IP4.GATEWAY:                            192.168.1.1
IP4.ROUTE[1]:                           dst = 192.168.1.0/24, nh = 0.0.0.0, mt = 600
IP4.ROUTE[2]:                           dst = 0.0.0.0/0, nh = 192.168.1.1, mt = 600
IP4.DNS[1]:                             5.188.51.236
IP4.DNS[2]:                             192.168.1.1
IP6.ADDRESS[1]:                         fe80::de74:300b:e8e5:c928/64
IP6.GATEWAY:                            --
IP6.ROUTE[1]:                           dst = fe80::/64, nh = ::, mt = 1024
[airdrop@aorus-pro-ac ~]$
[airdrop@aorus-pro-ac ~]$ nmcli dev show wlp6s0
GENERAL.DEVICE:                         wlp6s0
GENERAL.TYPE:                           wifi
GENERAL.HWADDR:                         00:E9:3A:9B:93:AF
GENERAL.MTU:                            1500
GENERAL.STATE:                          100 (connected)
GENERAL.CONNECTION:                     5G
GENERAL.CON-PATH:                       /org/freedesktop/NetworkManager/ActiveConnection/9
IP4.ADDRESS[1]:                         192.168.1.20/24
IP4.GATEWAY:                            192.168.1.1
IP4.ROUTE[1]:                           dst = 192.168.1.0/24, nh = 0.0.0.0, mt = 600
IP4.ROUTE[2]:                           dst = 0.0.0.0/0, nh = 192.168.1.1, mt = 600
IP4.DNS[1]:                             5.188.51.236
IP4.DNS[2]:                             192.168.1.1
IP6.ADDRESS[1]:                         fe80::de74:300b:e8e5:c928/64
IP6.GATEWAY:                            --
IP6.ROUTE[1]:                           dst = fe80::/64, nh = ::, mt = 1024
[airdrop@aorus-pro-ac ~]$ nslookup -type=ns domain.com
Server:         127.0.0.1
Address:        127.0.0.1#53

Non-authoritative answer:
domain.com      nameserver = sarah.ns.cloudflare.com.
domain.com      nameserver = lee.ns.cloudflare.com.

Authoritative answers can be found from:

[airdrop@aorus-pro-ac ~]$ ping sarah.ns.cloudflare.com
PING sarah.ns.cloudflare.com (172.64.34.218) 56(84) bytes of data.
64 bytes from sarah.ns.cloudflare.com (172.64.34.218): icmp_seq=1 ttl=57 time=102 ms
64 bytes from sarah.ns.cloudflare.com (172.64.34.218): icmp_seq=2 ttl=57 time=125 ms
^C
--- sarah.ns.cloudflare.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1001ms
rtt min/avg/max/mdev = 102.189/113.568/124.948/11.379 ms
[airdrop@aorus-pro-ac ~]$ lee.ns.cloudflare.com
bash: lee.ns.cloudflare.com: command not found
[airdrop@aorus-pro-ac ~]$ ping lee.ns.cloudflare.com
PING lee.ns.cloudflare.com (108.162.193.129) 56(84) bytes of data.
64 bytes from lee.ns.cloudflare.com (108.162.193.129): icmp_seq=1 ttl=57 time=70.7 ms
64 bytes from lee.ns.cloudflare.com (108.162.193.129): icmp_seq=2 ttl=57 time=61.5 ms
^C
--- lee.ns.cloudflare.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1000ms
rtt min/avg/max/mdev = 61.464/66.071/70.678/4.607 ms
[airdrop@aorus-pro-ac ~]$
[airdrop@aorus-pro-ac ~]$
[airdrop@aorus-pro-ac ~]$ dig +trace domain.com

; <<>> DiG 9.20.1 <<>> +trace domain.com
;; global options: +cmd
.                       84823   IN      NS      h.root-servers.net.
.                       84823   IN      NS      d.root-servers.net.
.                       84823   IN      NS      b.root-servers.net.
.                       84823   IN      NS      k.root-servers.net.
.                       84823   IN      NS      i.root-servers.net.
.                       84823   IN      NS      m.root-servers.net.
.                       84823   IN      NS      e.root-servers.net.
.                       84823   IN      NS      g.root-servers.net.
.                       84823   IN      NS      c.root-servers.net.
.                       84823   IN      NS      a.root-servers.net.
.                       84823   IN      NS      l.root-servers.net.
.                       84823   IN      NS      j.root-servers.net.
.                       84823   IN      NS      f.root-servers.net.
.                       84823   IN      RRSIG   NS 8 0 518400 20241028050000 20241015040000 61050 . U4aNfaZbCt9vjSCrrkERnCJ3Q2YhPrUhd477mtIQKN39MSDNzFTcBOQ+ WWftoG/fUyqmG6K+ibsRycQXX1+75590PVOz4SH726HTlIgaAxK+8eIM 6xLOzbPv2MC9aaDKCH3zI0qga2QIL8QGKvgIoQRsRF+LGc7ldOxy/Ntv l1TZ87WY6mzfBQ7OjkaqxFc3TEhvst4HJ1OdjOugDBvAyOfuOi7dKbxu m1Jq6EdaezkxLhngG08FtuqZPLRVTEDfI9e6UTc+bibf1kLcf7uRmsJn DxESm+ICrW/LDTF2pkL7kSSqnZYRpvz5Q1Fx+HUvUDa68IbXlO3Ad7Dc /j3v9w==
;; Received 525 bytes from 127.0.0.1#53(127.0.0.1) in 103 ms

;; communications error to 199.7.91.13#53: timed out
;; Received 51 bytes from 199.7.91.13#53(d.root-servers.net) in 3513 ms

[airdrop@aorus-pro-ac ~]$ nslookup -type=ns ru
Server:         127.0.0.1
Address:        127.0.0.1#53

Non-authoritative answer:
ru      nameserver = f.dns.ripn.net.
ru      nameserver = a.dns.ripn.net.
ru      nameserver = b.dns.ripn.net.
ru      nameserver = d.dns.ripn.net.
ru      nameserver = e.dns.ripn.net.

Authoritative answers can be found from:

[airdrop@aorus-pro-ac ~]$ nslookup -type=ns yandex.ru a.dns.ripn.net
Server:         a.dns.ripn.net
Address:        193.232.128.6#53

Non-authoritative answer:
yandex.ru       nameserver = ns2.yandex.ru.
yandex.ru       nameserver = ns1.yandex.ru.

Authoritative answers can be found from:
ns1.yandex.ru   internet address = 213.180.193.1
ns1.yandex.ru   has AAAA address 2a02:6b8::1
ns2.yandex.ru   internet address = 93.158.134.1
ns2.yandex.ru   has AAAA address 2a02:6b8:0:1::1

[airdrop@aorus-pro-ac ~]$



Информация по данным whois.registry.tcinet.ru
% TCI Whois Service
domain:
G-SERVICE.RU
nserver:
ns2.g-service.ru. 84.22.142.2
nserver:
ns.g-service.ru. 84.22.140.1
state:
REGISTERED, DELEGATED, VERIFIED
org:
IGRA-SERVISE LTD
taxpayer-id:
2466092240
registrar:
RU-CENTER-RU
admin-contact:
https://www.nic.ru/whois/send-message/?domain=g-service.ru
created:
2002-05-14T20:00:00Z
paid-till:
2025-05-14T21:00:00Z
free-date:
2025-06-15
source:
TCI
Last updated on 2024-10-15T14:16:31Z
