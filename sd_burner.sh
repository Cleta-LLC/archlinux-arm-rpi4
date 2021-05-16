#!/bin/bash
# Download and Install Arch Linux Arm to a Rpi4-64
# usage: ./sd_burner.sh /dev/sdc

# Check if user is root or sudo
if ! [ $( id -u ) = 0 ]; then
    echo "Please run this script as sudo or root" 1>&2
    exit 1
fi

DEFAULT_PARTITION=/dev/sdx
if [ "$1" ]; then
  echo "Chose SD partition: $1"
  DEFAULT_PARTITION=$1
else
  echo "No user argument using default value: ${DEFAULT_PARTITION}"
fi

# Export settings
export SDDEV=${DEFAULT_PARTITION}
export SDPARTBOOT=${SDDEV}1
export SDPARTROOT=${SDDEV}2
export SDMOUNT=/mnt/sd
export DOWNLOADDIR=/tmp/pi
echo -e -n "Settings:\nSDDEV=${SDDEV}\nBOOT=${SDPARTBOOT}\nROOT=${SDPARTROOT}\nSDMOUNT=${SDMOUNT}\nDOWNLOADDIR=${DOWNLOADDIR}\n"

# Download. Never cache.
mkdir -p $DOWNLOADDIR
(
  cd $DOWNLOADDIR && \
  curl -JLO http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-aarch64-latest.tar.gz
)

# Clean disk
sfdisk --quiet --wipe always $SDDEV << EOF
,256M,0c,
,,,
EOF
# Format disk
mkfs.vfat -F 32 $SDPARTBOOT
mkfs.ext4 -q -E lazy_itable_init=0,lazy_journal_init=0 -F $SDPARTROOT

# Mount partitions
mkdir -p $SDMOUNT
mount $SDPARTROOT $SDMOUNT
mkdir -p ${SDMOUNT}/boot
mount $SDPARTBOOT ${SDMOUNT}/boot

# Extract into SD
bsdtar -xpf ${DOWNLOADDIR}/ArchLinuxARM-rpi-aarch64-latest.tar.gz -C $SDMOUNT

# Change fstab
sed -i 's/mmcblk0/mmcblk1/' ${SDMOUNT}/etc/fstab

# Headless Boot - Replace Uboot
mkdir -p ${DOWNLOADDIR}/uboot
pushd ${DOWNLOADDIR}/uboot
curl -JLO http://ports.ubuntu.com/pool/universe/u/u-boot/u-boot-rpi_2020.10+dfsg-1ubuntu0~20.04.2_arm64.deb
ar x *.deb
tar xf data.tar.xz
cp usr/lib/u-boot/rpi_arm64/u-boot.bin ${SDMOUNT}/boot/kernel8.img
popd

# Sync and Umount
sync
umount -R $SDMOUNT
