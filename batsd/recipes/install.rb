#
# Cookbook Name:: batsd
# Recipe:: install
#
# Copyright 2014, xenor@listia.com
#
# All rights reserved - Do Not Redistribute
#

include_recipe "git"

chef_gem "bundler" do
  action :install
end

git "/opt/batsd" do
  repository "https://github.com/noahhl/batsd.git"
  reference node["batsd"]["version"]
end

bash "run bundle install" do
  cwd "/opt/batsd"
  code "bundle install"
end

# Create config file
template "/opt/batsd/config.yml" do
  owner "root"
  group "root"
  mode 0644
  source "config.yml.erb"
  variables({
    config: node["batsd"]["config"]
  })
end

# Create log path
directory node["batsd"]["log_dir"] do
  owner "root"
  group "root"
  mode 0755
  action :create
end

template "/etc/init.d/batsd-server" do
  owner "root"
  group "root"
  mode 0744
  source "batsd_server.sh.erb"
  variables({
    server_port: node["batsd"]["config"]["server_port"],
    log_dir: node["batsd"]["log_dir"]
  })
end

template "/etc/init.d/batsd-receiver" do
  owner "root"
  group "root"
  mode 0744
  source "batsd_receiver.sh.erb"
  variables({
    log_dir: node["batsd"]["log_dir"]
  })
end
