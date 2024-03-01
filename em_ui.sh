#!/bin/sh
#umount /mnt/sdcard
#mount -t exfat /dev/mmcblk0p9 /mnt/sdcard
export XDG_CONFIG_HOME=/sdcard/
export MG_CFG_PATH=/etc
#ffplay -t 0.1 -autoexit /mnt/sdcard/game_cfg/start.mp4
#aplay /usr/bin/open.wav

[ -e /sdcard/logo.mp4 ] && {
    ffplay -x 480 -y 273 -hide_banner -nostats -fs -vcodec h264 -autoexit /sdcard/logo.mp4
}

[ ! -d /sdcard/data ] && mkdir -p /sdcard/data

[ ! -e /data/volctrl ] && {
    echo 8 > /data/volctrl
}

if [  -e "/sdcard/test/game" ]; then
	export MG_CFG_PATH=/sdcard/test
	export LD_LIBRARY_PATH=/sdcard/test/lib
	/sdcard/test/game &
else
	swapon /sdcard/swapfile
	while true
	do
		/sdcard/emulationstation 
		killall -9 emulationstation
		killall -9 game
	done
	
fi

#/oem/em_exfat.sh &
#/sdcard/game_cfg/retroarch -y -12 -c /sdcard/game_cfg/w10.cfg -L /storage/cores/fbalpha2012_libretro.so /storage/roms/arcade/kof97.zip
#/sdcard/retroarch -c /usr/local/share/minigui/gbx66.cfg -L /storage/cores/fbalpha2012_libretro.so /storage/roms/arcade/kof97.zip