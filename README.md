# mint-wifi-server

Set of scripts that allow a user to create Wifi server. 

For example after setup and execution you can connect your telephone to your linux laptop via Wifi.

In my setup I create the Wifi server on 'Edimax' Wifi dongle.

This solution is obsolete on Ubuntu machines, since Ubuntu provides Wifi hotspot solution out of the box. This solution could be intresting for raspberry pi use on the other hand.

# Use cases

 - Linux machine VNC access (remote desktop)
 - Transfer files from Android phone to computer (pictures, etc.). I do not use Google pictures backup functionality
 - HTTP is one of the most commonly used protocols. After connect you can control your Linux device remotely. There are limitles possibilities
 - Fixed IPs allow to create reliable and secure server/client application. Bluetooth has some security holes
 - Mobile NAS, access point. You can install such solution on a raspberry PI, connect drives via USB on a remote site, you can watch your movies from the disks, or listen to music stored on your disks
 
 My own use cases:
 
   - presentation machine. I do not want to use the laptop for presentation. I can plug in wifi raspberry machine, and control it from afar. Everybody can access it
  
## Replace the Google pictures!

OK. So how do you transfer pictures from android phone to the computer?

 - download 'FTP manager +'
 - define SMB connection, by default you can use 'guest' access
 - navigate in 'FTP Manager +' to a directory with your pictures. For my xiaomi A2 Lit it is 'DCIM/Camera/'
 - select pictures you wish to move, click 'move'
 - navigate in the program to your SMB location, create a directory if necessary
 - paste files

# Prerequisites

 - isc-dhcp-server
 - hostapd
 - crda

# Installation

 - read your network card interface name (ifconfig). Change interface name in 'root' directory files. Copy the 'root' directory files to the root file system. If you worry about your current setup, then back it up, before copying the files. I assume you know what you are doing with your Linux setup
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

# Troubleshooting

 - If wifi is not visible on you client device, then your hostapd might be incorrectly configured
 - If wifi is not visible on you client device, then your client migh not be supported that Wifi standard version
 - If you can connect to Wifi, but 'Obtaining IP address' is still visible on the client, or the client cannot receive ip number, then most likely dhcpd is incorrectly configured
 - If you cannot create files, then it has something to do with SMB config/proviliges
 
 # TODO
 
 Maybe installation can be automated? Can a installation scripot be created?
 Bridge connection would be nice. To access laptop from a phone, and the laptop would allow the phone to transmit data with the Internet
