#!/bin/sh

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

ARG=${1//[\\]/}
#export SDL_AUDIODRIVER=alsa
export XDG_CONFIG_HOME=/sdcard/
export LD_LIBRARY_PATH=LD_LIBRARY_PATH:/sdcard/lib 

echo 6 > /sys/devices/platform/key_mode.0/key_mode

cd /sdcard/ppsspp/ && ./PPSSPPSDL --fullscreen "$ARG"
#/sdcard/minigui/game &

echo 0 > /sys/devices/platform/key_mode.0/key_mode
