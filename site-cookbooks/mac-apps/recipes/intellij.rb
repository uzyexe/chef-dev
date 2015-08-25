#
# Cookbook Name:: mac-apps
# Recipe:: Virtualbox
#
# Copyright 2013, tcnksm
#
# Refer, http://community.opscode.com/cookbooks/dmg

dmg_package "IntelliJ IDEA 12 CE" do
  source "http://download.jetbrains.com/idea/ideaIC-12.1.2.dmg"
  checksum "2438958ae3f5d553b009fd8a9382374974eb92ad69b32cecb2e9d9c206da1e95"
  action :install
end

