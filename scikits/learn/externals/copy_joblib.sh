#!/bin/sh
# Script to do a local install of joblib
rm -rf tmp joblib
mkdir -p tmp/lib/python2.6/site-packages
ln -s tmp/lib/python2.6 tmp/lib/python2.5
mkdir -p tmp/bin
export PYTHONPATH=$(pwd)/tmp/lib/python2.6/site-packages:$(pwd)/tmp/lib/python2.5/site-packages
easy_install -Zeab tmp joblib
old_pwd=$(pwd)
#cd /home/varoquau/dev/joblib/ 
cd tmp/joblib/
python setup.py install --prefix $old_pwd/tmp
cd $old_pwd
cp -r tmp/lib/python2.6/site-packages/joblib .
rm -rf tmp
