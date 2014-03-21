#!/bin/bash

CWD=$(dirname $0)
cd $CWD
exec bundle exec unicorn -p 8081 ./config.ru
