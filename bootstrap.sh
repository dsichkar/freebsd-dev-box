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

