#
# Cookbook Name:: idx
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

apt_package "glusterfs-client" do
  action :install
end

include_recipe "user"

user_account node["idx"]["user"] do
  create_group true
  ssh_keys node["idx"]["ssh_keys"]
  action :create
end

bash "mount and link shared folder" do
  code "mkdir #{node["idx"]["local_mount_point"]}"
  code "mount.glusterfs #{node["idx"]["remote_mount_point"]} #{node["idx"]["local_mount_point"]}"
end

bash "create symbolic link for shared folder" do
  code "ln -s #{node["idx"]["local_mount_point"]} #{node["idx"]["mount_symbolic_path"]}d"
  not_if { ::File.directory?(node["idx"]["mount_symbolic_path"]) }
end

file "/etc/fstab.d/#{node["idx"]["user"]}" do
  owner "root"
  group "root"
  mode "0644"
  action :create
  content "#{node["idx"]["remote_mount_point"]} #{node["idx"]["local_mount_point"]} glusterfs defaults,_netdev 0 0"
end
