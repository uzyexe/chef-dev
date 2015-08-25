#
# Cookbook Name:: apt
# Recipe:: default
#
# Copyright 2013, tcnksm
#

item = data_bag_item(:packages, "apt")

execute "apt-get-update" do
  user "root"
  command "apt-get update"
  action :run
end

item["targets"].each do |pkg|
  package pkg
end
