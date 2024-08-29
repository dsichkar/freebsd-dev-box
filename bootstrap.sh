#!/usr/bin/env bash

function install {
  echo installing $1
  shift
  sudo pkg install -yf "$@" >/dev/null 2>&1
}

install Curl curl
install Git git
install Nginx nginx-full
install Rails7 rubygem-rails71
install Redis redis
install Passenger rubygem-passenger-nginx

sudo service nginx enable
sudo service nginx start
sudo service redis enable
sudo service redis start

sudo gem install bundler -N
