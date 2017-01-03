#!/bin/sh

export TERM=xterm
wget http://us.download.nvidia.com/XFree86/Linux-x86_64/367.57/NVIDIA-Linux-x86_64-367.57.run
chmod +x NVIDIA-Linux-x86_64-367.57.run
sudo ./NVIDIA-Linux-x86_64-367.57.run --silent

