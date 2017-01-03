#!/bin/sh
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.0-rc/nvidia-docker_1.0.0.rc-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker_1.0.0.rc-1_amd64.deb && rm /tmp/nvidia-docker*.deb

# Check install
sudo nvidia-docker run --rm nvidia/cuda nvidia-smi

