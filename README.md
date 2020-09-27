# mint-wifi-server

Set of scripts that allow a user to create Wifi server. I operate on a laptop with a 'Edimax' dongle attached. The Wifi server functionality was enabled for that dongle. It does not provide any means of Network bridging. It allows only to connect to the laptop, from example, from telephone.

# Use cases

 - HTTP is one of the most commonly used protocols. After connect you can control your Linux device remotely. There are limitles possibilities
 - Fixed IPs allow to create server/client application
 - Linux machine can be controled via remote desktop
 
 My own use cases:
 
  - presentation machine. I do not want to use the laptop for presentation. I can plug in wifi raspberry machine, and control it from afar. Everybody can access it
  - I do not like bluetooth

# Prerequisites

 - isc-dhcp-server
 - hostapd
 - crda

# Installation

 - read your network card interface name (ifconfig). Copy the 'root' directory files to the root file system. If you worry about your current setup, then back it up, before copying the files. I assume you know what you are doing with your Linux setup
 - you can also use the scripts as they are, to 'copy' necessary values to your setup.
 - copy wifi.sh script to you local filesystem, give it's execution rihts. It does 'start' everything after you plug in your dongle

# Run

 - Insert dongle, or network card
 - Execute 'wifi.sh' script with root priviliges (sudo wifi.sh)

# Configuration

Everything was configured for the 'wlx801f02e69c1c' interface. To check your interface type 'ifconfig' into terminal. Find your interface name their.

Parts:

 - The Wifi setup
 - The DHCP setup
 - SMB

## The Wifi

As an example 'test' wifi with 'PASSWORD' password is defined.

## The DHCP setup

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

# Test

Tested on Linux Mint 19.3
