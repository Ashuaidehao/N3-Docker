#!/bin/bash

echo "Downloading neo node $1"
wget https://github.com/neo-project/neo-node/releases/download/$1/neo-cli-portable.zip

unzip neo-cli-portable.zip -d ./
wget https://github.com/neo-ngd/leveldb/releases/download/v1.23/libleveldb-linux-x64.zip
unzip libleveldb-linux-x64.zip -d ./
cp libleveldb-linux-x64/* ./neo-cli/runtimes/linux-x64/native

if [ -z "$2" ]; then
    echo "Downloading plugins $1"
    wget https://github.com/neo-project/neo-modules/releases/download/$1/ApplicationLogs.zip
    wget https://github.com/neo-project/neo-modules/releases/download/$1/RpcServer.zip
else
    echo "Downloading plugins $2"
    wget https://github.com/neo-project/neo-modules/releases/download/$2/ApplicationLogs.zip
    wget https://github.com/neo-project/neo-modules/releases/download/$2/RpcServer.zip
fi

unzip ApplicationLogs.zip -d ./neo-cli/
unzip RpcServer.zip -d ./neo-cli/

echo "Node Ready!"