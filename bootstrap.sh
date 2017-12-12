#!/usr/bin/env bash

sudo pkg update
sudo pkg upgrade
sudo pkg install -y openjdk8 doxygen python python3 py27-numpy py27-scipy py36-numpy py36-scipy cmake ninja lcov cppcheck gcc

