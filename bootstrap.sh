#!/usr/bin/env bash

function install {
  echo installing $1
  shift
  sudo pkg install -yf "$@" >/dev/null 2>&1
}

install Curl curl
install Git git
install Nginx nginx-full
install Rails7 rubygem-rails70

sudo service nginx enable
sudo service nginx start

sudo gem install bundler passenger -N
