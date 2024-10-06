#!/bin/sh
# centos 7 with systemd

sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

yum update -y && yum install -y \
  sudo \
  which \
  initscripts \
  file \
  htop \
  git \
  wget \
  nano \
  vim \
  telnet \
  zip \
  unzip \
  passwd \
  acl

# Install cron
yum install -y cronie

# Centos 7
# gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-44)
# Default: Python 2.7.5
yum install -y python3 python3-pip
#  - Python 3.6.8

# # Install python 3.x
# # Install GCC-8 Developer Tools
# # Python version 3.8.x upwards since the new versions of GCC are needed to compile Python on CentOS6/RHEL6
# # yum install devtoolset-8-gcc devtoolset-8-gcc-c++ -y
# # export CC=/opt/rh/devtoolset-8/root/usr/bin/gcc 
# PYTHON_VERSION="3.9.6"
# # Install gcc, make and more...:
# yum groupinstall "Development Tools"
# yum install -y gcc gcc-c++ kernel-devel openssl-devel bzip2-devel zlib-devel libffi-devel sqlite-devel

# # wget https://www.python.org/ftp/python/3.12.0/Python-3.12.0.tgz
# wget "https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz"
# tar xzf "Python-${PYTHON_VERSION}.tgz"
# cd "Python-${PYTHON_VERSION}"
# ./configure --enable-optimizations
# # make -j 4
# make
# # make install
# make altinstall

# # Set Alternative Python: To avoid conflicts with the system Python, set an alternative:
# # alternatives --install /usr/bin/python3 python3

# # Clean
# rm -rf "Python-${PYTHON_VERSION}" "Python-${PYTHON_VERSION}.tgz"
