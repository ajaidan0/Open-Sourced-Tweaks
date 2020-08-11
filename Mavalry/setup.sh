#!/bin/bash

export mavdir=$PWD
echo $mavdir
git clone https://github.com/Muirey03/RemoteLog.git
cd RemoteLog
sudo mv RemoteLog.h $THEOS/include
mv rlogserver.py $mavdir
cd $mavdir
rm -rf RemoteLog
echo "All set up."
echo "Tip: To set up remote log to give you logs, change all instances of 'your ip here' inside of the theos/include/RemoteLog.h file to your ip, open rlogserver.py, and watch those logs come in!"
