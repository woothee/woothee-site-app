#!/bin/bash

CWD=$(dirname $0)
cd $CWD
export PORT=8084
exec node app.js
