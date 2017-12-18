#!/usr/bin/env bash
sudo mkdir -p /usr/local/etc/pkg/repos/
sudo cp /usr/home/vagrant/FreeBSD.conf /usr/local/etc/pkg/repos/
sudo cp /usr/home/vagrant/FreeBSD-latest.conf /usr/local/etc/pkg/repos/

sudo pkg update
sudo pkg upgrade -y
sudo pkg install -y openjdk8 doxygen python python3 py27-numpy py27-scipy py36-numpy py36-scipy cmake ninja lcov cppcheck gcc

