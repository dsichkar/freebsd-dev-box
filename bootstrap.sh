#!/usr/bin/env bash

function install {
  echo installing $1
  shift
  sudo pkg install -yf "$@" >/dev/null 2>&1
}

install Bash bash
install Curl curl
install Git git
install Ruby-build ruby-build
install Sqlite3 sqlite3
install Libxml2 libxml2
install Libxslt libxslt
install Rbenv rbenv
install Apache apache24
install Mysql mysql57-server

sudo service apache24 enable
sudo service apache24 start
sudo service mysql-server enable
sudo service mysql-server start

rbenv install 2.7.4
eval "$(rbenv init - bash)"
echo 'eval "$(rbenv init - bash)"' > .bash_profile
rbenv global 2.7.4

gem install sqlite3 -N -- --with-sqlite3-dir=/usr/local --with-sqlite3-lib=/usr/local/lib
gem install bundler passenger -N

yes | passenger-install-apache2-module

