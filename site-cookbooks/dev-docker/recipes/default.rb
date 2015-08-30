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
  registry_mirror "http://#{node['ipaddress']}:5000"
  action [:create, :start]
end

docker_image 'registry' do
  tag 'latest'
  action :pull
  notifies :redeploy, 'docker_container[registry]'
end

docker_container 'registry' do
  repo 'registry'
  tag 'latest'
  env [
    'STANDALONE=false',
    'MIRROR_SOURCE=https://registry-1.docker.io',
    'MIRROR_SOURCE_INDEX=https://index.docker.io',
    'SQLALCHEMY_INDEX_DATABASE=sqlite:////tmp/registry/docker-registry.db',
    'SQLALCHEMY_INDEX_DATABASE=sqlite:////tmp/registry/docker-registry.db'
  ]
  dns ['8.8.8.8', '8.8.4.4']
  port '5000:5000'
  volumes ['/tmp/registry:/tmp/registry']
  action :run
end

