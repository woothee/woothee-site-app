#!/bin/bash

CWD=$(dirname $0)
cd $CWD
exec carton exec -Ilib plackup -p 8083 -s Starlet ./app.psgi
