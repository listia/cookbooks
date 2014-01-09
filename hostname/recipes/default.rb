#
# Cookbook Name:: hostname
# Recipe:: default

raise Chef::Log.warn "Please set hostname" unless node["hostname"]["name"]

template "/etc/hostname" do
  owner "root"
  group "root"
  mode 0644
  source "hostname.erb"
  variables({
    hostname: node["hostname"]["name"]
  })
end

ruby_block "replace hostname" do
  block do
    host_file = Chef::Util::FileEdit.new("/etc/hosts")
    host_file.search_file_replace_line(/^127.0.0.1\slocalhost&/,
                               "127.0.0.1 localhost #{node["hostname"]["name"]}")
    host_file.write_file
  end
end

execute "restart_newrelic" do
  command "hostname #{node["hostname"]["name"]}"
  command "service newrelic-sysmond restart"
end
