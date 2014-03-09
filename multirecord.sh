#!/bin/sh

# Use e.g. pavucontrol to select audio inputs

WORKDIR=`date +%Y%m%d%H%M%S`
mkdir -v $WORKDIR
cd $WORKDIR
ffmpeg \
	-f alsa -i pulse \
	-f alsa -i pulse \
	-f alsa -i pulse \
	-f alsa -i pulse \
	-s 1920x1080 -f x11grab -i :0 \
	-vcodec libx264 -acodec libmp3lame -qscale:a 2 -qscale:v 18 \
	-map 0 \
	-map 1 \
	-map 2 \
	-map 3 \
	-map 4 \
	output.mp4
