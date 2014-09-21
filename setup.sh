#!/bin/bash

if [[ $EUID -ne 0 ]]; then
echo "This script must be run as root" 1>&2
   exit 1
fi

function install_git {
   check_install git git
}

function install_rvm {
   curl -L https://get.rvm.io | bash -s stable --ruby
}

function install_ruby {
   rvm install 1.9.3
}

function switch_193 {
   rvm use 1.9.3
}

function ruby_gems {
   rvm rubygems latest
}

function git_clone {
   git clone git://github.com/imathis/octopress.git octopress
}

function chdir {
   cd octopress
}

function install_bundler {
   gem install bundler
}

function install_bundle {
   bundle install
}

function default_theme {
   rake install
}

*)
   install_git
   install_rvm
   install_ruby
   switch_193
   ruby_gems
   git_clone
   chdir
   install_bundler
   install_bundle
   default_theme
   ;;
