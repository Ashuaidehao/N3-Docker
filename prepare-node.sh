#!/bin/bash

nodeversion="v3.1.0"
pluginsversion=$nodeversion

echo "Downloading neo node $nodeversion"
wget https://github.com/neo-project/neo-node/releases/download/$nodeversion/neo-cli-portable.zip

unzip neo-cli-portable.zip -d ./
wget https://github.com/neo-ngd/leveldb/releases/download/v1.23/libleveldb-linux-x64.zip
unzip libleveldb-linux-x64.zip -d ./
cp libleveldb-linux-x64/* ./neo-cli/runtimes/linux-x64/native

echo "Downloading plugins $pluginsversion"
wget https://github.com/neo-project/neo-modules/releases/download/$pluginsversion/ApplicationLogs.zip
wget https://github.com/neo-project/neo-modules/releases/download/$pluginsversion/RpcServer.zip
unzip ApplicationLogs.zip -d ./neo-cli/
unzip RpcServer.zip -d ./neo-cli/

sed -i "s/127.0.0.1/0.0.0.0/g" neo-cli/Plugins/RpcServer/config.json

echo "Node Ready!"

# if [ -z "$2" ]; then
#     echo "Downloading plugins $plguinsversion"
#     wget https://github.com/neo-project/neo-modules/releases/download/$plguinsversion/ApplicationLogs.zip
#     wget https://github.com/neo-project/neo-modules/releases/download/$plguinsversion/RpcServer.zip
# else
#     echo "Downloading plugins $2"
#     wget https://github.com/neo-project/neo-modules/releases/download/$2/ApplicationLogs.zip
#     wget https://github.com/neo-project/neo-modules/releases/download/$2/RpcServer.zip
# fi

