default['openvpn']['packages'] = %w{
  openvpn
  easy-rsa
  zip
  unzip
}
default['openvpn']['route'] = %w{
  172.31.0.0\ 255.255.0.0
}

default['openvpn']['network'] = "172.27.254.0"
default['openvpn']['network_mask'] = "255.255.255.0"
default['openvpn']['static_net'] = "172.24.2.0"
default['openvpn']['static_net_mask'] = "255.255.255.0"
default['openvpn']['server'] = "54.178.143.26"
default['openvpn']['port'] = "443"
default['openvpn']['proto'] = "tcp"
default['openvpn']['proxy'] = "xx.xx.xx.xx 80"
default['openvpn']['dnsserver'] = %w{
	172.27.0.2
}
default['openvpn']['sitename'] = "oursite"

default['openvpn']['key']['ca_expire'] = 3650
default['openvpn']['key']['expire'] = 3650
default['openvpn']['key']['size'] = 2048
default['openvpn']['key']['country'] = 'JP'
default['openvpn']['key']['province'] = 'Osaka'
default['openvpn']['key']['city'] = 'Osaka'
default['openvpn']['key']['org'] = 'My Company'
default['openvpn']['key']['email'] = 'admin@example.com'
