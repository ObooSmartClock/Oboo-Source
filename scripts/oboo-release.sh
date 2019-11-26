#! /bin/sh

## script to copy device target binaries to release directory

buildNum=$(cat files/etc/uci-defaults/12_onion_version  | grep build | sed -e 's/^.*=.//' -e 's/.$//')
releaseNum=""

copyTargetBin () {
	local device="$1"
	local name="$device-b$buildNum.bin"
	if [ "$2" != "" ]; then
		name="$device-b$buildNum-r$2.bin"
	fi

	cp bin/targets/ramips/mt7688/lede-ramips-mt7688-${device}-squashfs-sysupgrade.bin release/$name
	echo "> Released: $name"
}

# parse arguments
if [ "$1" != "" ]; then
	releaseNum="$1"
fi

copyTargetBin "oboo-smart-clock" "$releaseNum"
copyTargetBin "oboo-maker-clock" "$releaseNum"

echo "> Done"
