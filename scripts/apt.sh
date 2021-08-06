#!/bin/bash

echo "~~~ Update/upgrading apt ~~~"
sudo apt-get update -y
sudo apt-get upgrade -y
echo "~~~ Installing required packages ~~~"
sudo apt install vim \
	build-essential \
	cmake \
	vim \
	git \
	clang \
	inotify-tools \
	exa \
	pkg-config \
	curl -y

echo "~~~ Installing packages for ASDF ~~~"
sudo apt-get -y install autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk
