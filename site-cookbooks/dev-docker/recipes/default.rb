#
# Cookbook Name:: dev-docker
# Recipe:: default
#
# Copyright 2015, uzy
#
# All rights reserved - Do Not Redistribute
#

docker_service 'default' do
  host 'unix:///var/run/docker.sock'
  registry_mirror "http://#{node['ipaddress']}:5001"
  action [:create, :start]
end

docker_image 'registry' do
  tag '2'
  action :pull
  notifies :redeploy, 'docker_container[registry]'
end

docker_container 'registry' do
  repo 'registry'
  tag '2'
  port '5001:5000'
  action :run
end
