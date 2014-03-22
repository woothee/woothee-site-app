#!/bin/bash

export PATH=/home/tagomoris/local/ruby-2.1/bin:$PATH
CWD=$(dirname $0)
cd $CWD
exec bundle exec unicorn -p 8081 ./config.ru
