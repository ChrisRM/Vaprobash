#!/usr/bin/env bash

echo ">>> Installing FFMpeg"

# Download latest static build
wget http://ffmpeg.gusari.org/static/64bit/ffmpeg.static.64bit.latest.tar.gz
sudo tar -zxvf ffmpeg.static.64bit.latest.tar.gz

# Make'em global
sudo mv ffmpeg /usr/local/bin
sudo mv ffprobe /usr/local/bin 