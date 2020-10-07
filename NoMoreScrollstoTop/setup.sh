#!/bin/bash

export scrollsdir=$PWD
echo $scrollsdir
git clone https://github.com/SparkDev97/libSparkAppList.git
cd libSparkAppList
sudo mv headers/*.h $THEOS/include/libSparkAppList
sudo mv lib/libsparkapplist.dylib $THEOS/lib
cd $scrollsdir
rm -rf libSparkAppList
echo "All set up."