default['openvpn']['packages'] = %w{
  openvpn
  easy-rsa
  zip
  unzip
}
default['openvpn']['route'] = %w{
  172.16.1.0\ 255.255.255.0
  172.18.0.0\ 255.255.255.0
  172.18.3.0\ 255.255.255.0
  172.18.4.0\ 255.255.255.0
}

default['openvpn']['network'] = "172.24.1.0"
default['openvpn']['network_mask'] = "255.255.255.0"
default['openvpn']['static_net'] = "172.24.2.0"
default['openvpn']['static_net_mask'] = "255.255.255.0"
default['openvpn']['server'] = "10.3.111.134"
default['openvpn']['port'] = "443"
default['openvpn']['proto'] = "tcp"
default['openvpn']['proxy'] = "192.168.49.252 80"
default['openvpn']['dnsserver'] = %w{
	172.18.4.1
	172.18.4.2
}
default['openvpn']['sitename'] = "oursite"

default['openvpn']['key']['ca_expire'] = 3650
default['openvpn']['key']['expire'] = 3650
default['openvpn']['key']['size'] = 1024
default['openvpn']['key']['country'] = 'JP'
default['openvpn']['key']['province'] = 'Osaka'
default['openvpn']['key']['city'] = 'Osaka'
default['openvpn']['key']['org'] = 'My Company'
default['openvpn']['key']['email'] = 'admin@example.com'
