#!/usr/bin/env sh

## /// bt4alpine // ConzZah // 2026 ///

## symlink iptables so bluetooth nap actually works
[ ! -f /sbin/iptables ] && doas ln -s /usr/sbin/iptables /sbin/iptables

## add bluetooth packages:
doas apk add blueman bluez bluez-obexd bluez-deprecated bluetuith pipewire-spa-bluez cairo

## start services
doas modprobe btusb
doas adduser "$USER" lp
doas rc-service bluetooth start
doas rc-update add bluetooth default
doas rc-update add bluetooth boot

## start blueman-manager
blueman-manager >/dev/null 2>&1 &
