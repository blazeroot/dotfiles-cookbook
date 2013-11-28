#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright (C) 2013 Tomasz Weissbek
#

include_recipe "git"
include_recipe "zsh"

u    = node[:dotfiles][:user]
home = u['name'] == 'root' ? '/root' : "/home/#{u['name']}"

git "#{home}/.dotfiles" do
  repository 'https://github.com/blazeroot/dotfiles.git'
  reference 'master'
  action :sync
  enable_submodules true
end

bash 'Setup dotfiles' do
  user u['name']
  cwd "#{home}/.dotfiles"
  environment 'HOME' => home
  code <<-EOH
    "#{home}/.dotfiles/spread"
  EOH
end

user u['name'] do
  action :modify
  shell '/bin/zsh'
end
