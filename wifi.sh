#!/bin/bash

service isc-dhcp-server restart
hostapd /etc/hostapd/hostapd.conf
