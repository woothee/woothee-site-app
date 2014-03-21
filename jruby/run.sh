#!/bin/bash

CWD=$(dirname $0)
cd $CWD
exec bundle exec rackup -p 8082 -s mizuno ./config.ru
