#
# Cookbook Name:: openvpn
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


remote_file "#{Chef::Config[:file_cache_path]}/epel-release.noarch.rpm" do
 	source "http://dl.fedoraproject.org/pub/epel/#{node[:platform_version].to_i}/#{node[:kernel][:machine]}/epel-release-#{node[:platform_version].to_i}-8.noarch.rpm"
end

rpm_package "epel-release" do
 	action :install
 	source "#{Chef::Config[:file_cache_path]}/epel-release.noarch.rpm"
end


node['openvpn']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

template "/etc/openvpn/server.conf" do
  source "server.conf.erb"
  owner "root"
  mode 0644
  # notifies :restart, "service[openvpn]"
end

template "/etc/sysctl.conf" do
  source "sysctl.conf.erb"
  owner "root"
  mode 0644
  notifies :run, "execute[sysctl]"
end

execute "sysctl" do
	command "/sbin/sysctl -p"
	action :nothing
end

template "/etc/sysconfig/iptables" do
	source "iptables.erb"
	owner "root"
	group "root"
	mode 00600
	notifies :restart, "service[iptables]"
end


execute "easy-rsa" do
	command "cp -r /usr/share/easy-rsa/2.0 /etc/openvpn/easy-rsa"
  not_if { ::File.exists?("/etc/openvpn/easy-rsa") }
end

template "/etc/openvpn/easy-rsa/vars" do
	source "vars.erb"
	owner "root"
	group "root"
	mode 00644
end

execute "ccd" do
	command "mkdir /etc/openvpn/ccd"
  not_if { ::File.exists?("/etc/openvpn/ccd") }
end


remote_directory "/etc/openvpn/easy-rsa/keys" do
	source "keys"
	files_owner "root"
	files_group "root"
	files_mode 00644
	owner "root"
	group "root"
	mode 00755
	not_if { ::File.exists?("/etc/openvpn/easy-rsa/keys") }
end

execute "old key dir" do
	command "mkdir /etc/openvpn/easy-rsa/keys/old"
  not_if { ::File.exists?("/etc/openvpn/easy-rsa/keys/old") }
end

template "/etc/openvpn/easy-rsa/keys/#{node['openvpn']['sitename']}.ovpn" do
	source "mysite.ovpn.erb"
	owner "root"
	group "root"
	mode 00644
end

template "/usr/local/bin/mkvpncert.sh" do
	source "mkvpncert.sh.erb"
	owner "root"
	group "root"
	mode 00755
end

template "/usr/local/bin/revokecert.sh" do
	source "revokecert.sh.erb"
	owner "root"
	group "root"
	mode 00755
end

       
# service "openvpn" do
#   supports :status => true, :restart => true, :reload => true
#   action [ :enable, :start ]
# end

service "iptables" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
