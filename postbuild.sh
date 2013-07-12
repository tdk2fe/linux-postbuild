#!/bin/bash

# Script to install useful items after a fresh Linux OS install (CentOS/RHEL)

if [ `id -u` -gt 0 ]; then
  echo You must be root to run this script!
	exit
fi 

yum groupinstall -y "Development Tools"
yum install -y  <<- _EOF_
	zlib-devel bzip2-devel openssl-devel ncurses-devel 
	libxslt libxslt-devel libxml2 libxml2-devel 
	tk tkinter tk-devel fuse fuse-devel fuse-sshfs fuse-python
_EOF_




cd /opt/
wget http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tar.bz2
bunzip2 Python-2.7.3.tar.bz2 && tar xvf Python-2.7.3.tar
/opt/Python-2.7.3/configure --prefix=/usr/local
make && make altinstall
ln -s /usr/local/bin/python2.7 /usr/local/bin/python

wget https://bitbucket.org/pypa/setuptools/raw/0.8/ez_setup.py -O - | python

wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py
python get-pip.py 
pip install virtualenv
