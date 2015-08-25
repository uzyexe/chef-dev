#
# Cookbook Name:: mac-apps
# Recipe:: Google Chrome
#
# Copyright 2013, tcnksm
#
# Refer, http://community.opscode.com/cookbooks/dmg

dmg_package "Dropbox" do
  volumes_dir "Dropbox Installer"
  source "http://www.dropbox.com/download?plat=mac"
  checksum "b4ea620ca22b0517b75753283ceb82326aca8bc3c86212fbf725de6446a96a13"
  action :install
end
