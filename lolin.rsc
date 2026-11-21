/interface bridge
add name=bridge1
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-onlyn disabled=no frequency=auto \
    mode=ap-bridge ssid=
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa2-psk mode=dynamic-keys \
    supplicant-identity=MikroTik wpa2-pre-shared-key=****
/ip pool
add name=dhcp_pool0 ranges=192.168.xx.100-192.168.xx.200
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=bridge1 name=dhcp1
/interface bridge port
add bridge=bridge1 interface=wlan1
add bridge=bridge1 interface=ether2
/ip address
add address=192.168.xx.254/24 interface=bridge1 network=192.168.xx.0
/ip dhcp-server network
add address=192.168.xx.0/24 dns-none=yes
