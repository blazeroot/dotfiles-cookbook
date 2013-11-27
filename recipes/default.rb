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

bash 'Setup dotfiles' do
  cwd "#{home}/.dotfiles"
  environment 'HOME' => home
  code <<-EOH
    "#{home}/.dotfiles/spread"
  EOH
end

user user['name'] do
  action :modify
  shell '/bin/zsh'
end
