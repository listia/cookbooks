#
# Cookbook Name:: batsd
# Recipe:: default
#
# Copyright 2014, xenor@listia.com
#
# All rights reserved - Do Not Redistribute
#

include_recipe "batsd::install"

service "batsd-server" do
  action [:enable, :start]
end

service "batsd-receiver" do
  action [:enable, :start]
end
