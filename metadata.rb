name             'dotfiles'
maintainer       'Tomasz Weissbek'
maintainer_email 'blazeroot@gmail.com'
license          'All rights reserved'
description      'Installs/Configures blazeroot\'s dotfiles'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w(git zsh).each { |cookbook| depends cookbook }
