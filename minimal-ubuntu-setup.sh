#!/bin/bash

# install graphic manager
sudo apt-get update
sudo apt-get install xserver-xorg

# setup i3 ppa and install i3
sudo sh -c 'echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list.d/i3.list'
sudo apt-get update
sudo apt-get --allow-unauthenticated install sur5r-keyring
sudo apt-get update
sudo apt-get install i3

# install x window manager starter
sudo apt-get install xinit

# start x window manager (automatically start i3)
# startx

# setup chrome ppa and install chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get install google-chrome-stable

# install network manager
sudo apt-get install wicd-curses

# install utils
sudo apt-get install htop
sudo apt-get install tree
sudo apt-get install software-properties-common
sudo apt-get install vim
sudo apt-get install git

# install jdk8
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

# enable sound
sudo apt-get install alsa-base gstreamer0.10-alsa
sudo usermod -a -G audio vu

# setup inkscape ppa and install it
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt-get update
sudo apt-get install inkscape

# install support packages for 32bit programs
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 zlib1g:i386
