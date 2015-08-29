#
# Cookbook Name:: dotfile
# Recipe:: default
#

repo = "https://github.com/#{node[:dotfile][:username]}/dotfiles.git"

git node["user"]["home"]+"/.dotfiles" do 
  user  node["user"]["name"]
  group node["user"]["group"]
  repository repo
  reference "master"
  action :checkout
end

bash "install-dotfile" do
  user node['user']['name']
  group node['user']['group'] 
  cwd node['user']['home']
  environment "HOME" => node['user']['home']
  
  code <<-EOC
    cd ~/.dotfiles
    git checkout master
    rake all
  EOC
end
