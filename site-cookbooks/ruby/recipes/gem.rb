#
# Cookbook Name:: ruby
# Recipe:: gem
#
# Copyright 2013, tcnksm
#

item = data_bag_item(:packages, "rubygem")

item["targets"].each do |pkg, ver|
  gem_package pkg do
    action :install
    version ver if not ver.empty?
  end
end
