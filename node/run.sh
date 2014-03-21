#!/bin/bash

export PATH=$HOME/local/node-v0.10/bin:$PATH
CWD=$(dirname $0)
cd $CWD
export PORT=8084
exec node app.js
