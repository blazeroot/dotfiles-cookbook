#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright (C) 2013 Tomasz Weissbek
#

include_recipe "git"
include_recipe "zsh"

user = node[:dotfiles][:user]
home = user['name'] == 'root' ? '/root' : "/home/#{user['name']}"

git "#{home}/.dotfiles" do
  repository 'https://github.com/blazeroot/dotfiles.git'
  reference 'master'
  action :sync
  enable_submodules true
end

#bash "clone blazeroot dotfiles" do
#  user user['name']
#  cwd home
#  code <<-EOH
#    git clone https://github.com/blazeroot/dotfiles.git .dotfiles
#    git submodule init
#    git submodule update
#  EOH
#end

user user['name'] do
  action :modify
  shell '/bin/zsh'
end
