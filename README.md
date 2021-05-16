# archlinux-arm-rpi4

Specific scripts for installing archlinux arm into a raspberry pi 4 64 bits

## Install

Clone and add execute permissions.

```
$ git clone git@github.com:Cleta-LLC/archlinux-arm-rpi4.git
$ git chmod +x ./sd_burner.sh
```

## Run

## NOTE: THIS WILL ERASE ALL THE TARGET DEV DATA.

## NOTE: THIS WILL DOWNLOAD OVER 200MB DATA.

Locate your sd card by running `lsblk` or similar and run with sudo.

```
$ sudo ./sd_burner.sh /dev/sdc
```

The first argument is the target device.
Ensure that the correct drive is chosen, once the data it's gone, it's gone.

## Purpose

- Provide the Arch experience in a Raspberry Pi.
- Clean archlinux arm installation into a drive.
- Raspi aarm64 Kernel change.
- Patch for Headless start. Without this you need to connect a monitor to the pi to activate ssh.

## Contribute

Feel free to provide tickets and MRs.

We're looking to expand this script to cache the download on a /tmp/ directory.

## Support

Feel free to sponsor us.
