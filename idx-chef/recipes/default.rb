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

user_account "listia" do
  create_group true
  ssh_keys node["idx"]["ssh_keys"]
  action :create
end

bash "mount and link shared folder" do
  code "mkdir /mnt/listia"
  code "mount.glusterfs #{node["idx"]["mount_path"]} /mnt/listia"
  code "ln -s /mnt/listia /home/listia/shared"
end
