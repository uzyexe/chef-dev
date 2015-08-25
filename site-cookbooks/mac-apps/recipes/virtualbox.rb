#
# Cookbook Name:: mac-apps
# Recipe:: Virtualbox
#
# Copyright 2013, tcnksm
#
# Refer, http://community.opscode.com/cookbooks/dmg

dmg_package "Virtualbox" do
  source "http://dlc.sun.com.edgesuite.net/virtualbox/4.0.8/VirtualBox-4.0.8-71778-OSX.dmg"
  type "mpkg"
end
