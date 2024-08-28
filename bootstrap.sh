#!/usr/bin/env bash

function install {
  echo installing $1
  shift
  sudo pkg install -yf "$@" >/dev/null 2>&1
}

install Curl curl
install Git git
install Apache apache24
install Mysql mysql57-server
install Rails7 rubygem-rails70

sudo service apache24 enable
sudo service apache24 start
sudo service mysql-server enable
sudo service mysql-server start

sudo gem install bundler passenger -N

yes | sudo passenger-install-apache2-module
