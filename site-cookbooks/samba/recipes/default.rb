#
# Cookbook Name:: samba
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "samba" do
    action :install
end

service "smb" do
    action [:enable, :start]
    supports :restart => true
end

service "nmb" do
    action [:enable, :start]
    supports :restart => true
end

Template "/etc/samba/smb.conf" do
    source "smb.conf.erb"
    owner "root"
    group "root"
    mode 0777
    notifies :restart, "service[smb]"
    notifies :restart, "service[nmb]"
end                       
