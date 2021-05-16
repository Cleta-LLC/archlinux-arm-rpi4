# archlinux-arm-rpi4

Specific script for installing archlinux arm into a raspberry pi 4 64 bits. [Github Pages](https://cleta-llc.github.io/archlinux-arm-rpi4/)

## Install

[Clone](https://github.com/Cleta-LLC/archlinux-arm-rpi4/) with `git` or [Download](https://github.com/Cleta-LLC/archlinux-arm-rpi4/releases) with `curl`. You can also use `wget` or get creative.

```
$ git clone git@github.com:Cleta-LLC/archlinux-arm-rpi4.git
$ curl -o sd_burner.sh https://raw.githubusercontent.com/Cleta-LLC/archlinux-arm-rpi4/main/sd_burner.sh
```

Add execute permissions.

```
$ sudo chmod +x ./sd_burner.sh
```

## Run

#### NOTE: THIS WILL ERASE ALL THE TARGET DEV DATA.

#### NOTE: THIS WILL DOWNLOAD OVER 200MB DATA.

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

Feel free to sponsor us on: [github](https://github.com/sponsors/Cleta-LLC)

Accept cypto donatons to [etherscan](https://etherscan.io/address/0x92516f81d6b9e4caa44e28b339a16907c07221fd) wallet:

    0x92516F81D6B9e4cAa44e28B339a16907C07221fD
