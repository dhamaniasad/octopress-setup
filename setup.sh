#!/bin/bash

if [[ $EUID -ne 0 ]]; then
echo "This script must be run as root" 1>&2
   exit 1
fi

# Install git

apt-get -y install git

# Install curl

apt-get -y install curl

# Install RVM

curl -L https://get.rvm.io | bash -s stable --ruby

# Install Ruby 1.9.3

rvm install 1.9.3

# Switch to Ruby 1.9.3

rvm use 1.9.3

# Install Rubygems

rvm rubygems latest

# Install node.js

apt-get -y install nodejs

# Clone Octopress git repository

git clone git://github.com/imathis/octopress.git octopress

# Switch to octopress dir

cd octopress

# Install bundler

gem install bundler

# Install bundle
   
bundle install

# Install default theme  

rake install
