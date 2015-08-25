#
# Cookbook Name:: brew
# Recipe:: default
#
# Copyright 2013, tcnksm
#
item = data_bag_item(:packages, "homebrew")

item["targets"].each do |pkg|
  package pkg
end
