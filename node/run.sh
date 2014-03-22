#!/bin/bash

export PATH=/home/tagomoris/local/node-v0.10/bin:$PATH
CWD=$(dirname $0)
cd $CWD
export PORT=8084
exec node index.js
