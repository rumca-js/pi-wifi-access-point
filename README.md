# pi-wifi-server

Set of scripts that allow a user to create Wifi Access Point. Creates WIFI session.

In my setup I create the Wifi server on 'Edimax' Wifi dongle.

This solution is obsolete on Ubuntu machines, since Ubuntu provides Wifi hotspot solution out of the box. 

# Use cases

 - Making wireless hard drive (accessing hard drive through raspberry as Access Point)
 - Controlling raspberry device by Wifi connection, where you as a client connect to the Wifi distributed by raspberry
 - Easier to develop programs using HTTP than bluetooth between raspberry Access Point & client device
 
 My own use cases:
 
 - transfer files from phone to laptop when I'm on a trip (laptop operation as Wifi Access Point)

# Prerequisites

 - isc-dhcp-server
 - hostapd
 - crda

# Use

 - These scripts should be used as a point of reference
 - if you plan on using a wifi dongle insert the dongle
 - read your network card interface name (ifconfig). my device interface name was 'wlx801f02e69c1c', the files include that name

# Configuration

Parts:

 - The Wifi setup
 - The DHCP setup
 - SMB

## The Wifi

configuration file: /etc/hostapd/hostapd.conf
This configuration:
SSID: 'test',
password: 'PASSWORD'
country_code=PL

## The DHCP setup

configuration file: /etc/dhcp/dhcpd.conf
The computer acts as a server, has 192.168.20.1 IP.

## SMB

Addtionally samba share could be created on the Linux workstation.

Edit file /etc/samba/smb.conf and provide for "user":

```
[Shared]
comment = Public storage
path=/home/user/Shared
read only=no
browseable=Yes
```

After wifi-connect you will be able to browse the directory.

# Troubleshooting

 - If wifi is not visible on you client device, then your hostapd might be incorrectly configured
 - If wifi is not visible on you client device, then your client migh not be supported that Wifi standard version
 - If you can connect to Wifi, but 'Obtaining IP address' is still visible on the client, or the client cannot receive ip number, then most likely dhcpd is incorrectly configured
 - If you cannot create files, then it has something to do with SMB config/proviliges

# TODO

automate via python script
