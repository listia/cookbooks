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

user_account node["app"]["user"] do
  create_group true
  ssh_keys node["app"]["ssh_keys"]
  action :create
end

bash "mount and link shared folder" do
  code "mkdir #{node["app"]["local_mount_point"]}"
  code "mount.glusterfs #{node["app"]["remote_mount_point"]} #{node["app"]["local_mount_point"]}"
end

bash "create symbolic link for shared folder" do
  code "ln -s #{node["app"]["local_mount_point"]} #{node["app"]["mount_symbolic_path"]}d"
  not_if { ::File.directory?(node["app"]["mount_symbolic_path"]) }
end

file "/etc/fstab.d/#{node["app"]["user"]}" do
  owner "root"
  group "root"
  mode "0644"
  action :create
  content "#{node["app"]["remote_mount_point"]} #{node["app"]["local_mount_point"]} glusterfs defaults,_netdev 0 0"
end

bash "rvm" do
  user node["app"]["user"]
  code "curl -sSL https://get.rvm.io | bash -s stable"
  code "echo \"gem: --no-ri --no-rdoc\" >> ~/.gemrc"
  code "source ~/.rvm/scripts/rvm"

  code "rvm install #{node["app"]["ruby-version"]} --patch railsexpress"
  code "rvm use #{node["app"]["ruby-version"]} && shift"

  node["app"]["gems"].each do |gem_name|
    code "gem install #{gem_name}"
  end
end

bash "imagemagick" do
  code "wget --no-verbose https://launchpad.net/imagemagick/main/6.6.9-7/+download/ImageMagick-6.6.9-7.tar.gz"
  code "tar zxf ImageMagick-6.6.9-7.tar.gz"
  code "rm -f ImageMagick-6.6.9-7.tar.gz"
  code "apt-get install -y -q libjpeg8-dev libpng12-dev"
  code "cd ImageMagick-6.6.9-7"

  code "./configure --quiet"
  code "make -s"
  code "make -s install"
  code "ldconfig /usr/local/lib"
end


