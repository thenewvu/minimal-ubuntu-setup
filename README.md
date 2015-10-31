## What's it ?

A setup script and dot files that helps you build up a minimal but powerful Ubuntu system with the Unix philosophy `Do One Thing and Do It Well` in mind for developer.

## Why ?

We usually expect more than what a single thing provides, this leads to a scene where one thing has to do many jobs. Did it do them well ? Are you happy with it ? The answers usually are `No` and `No`!

Why you have to want your Vim become a Python IDE that includes a debugger, a autocompleter, a builder, a VCS client... and in fact that you never be happy with it, because there is always something that not perfect and you never accept that.

So ... what's the point ?

The point is Vim was not made to achieve that goal (becomes a Python IDE). What you did just forces it to be. Try `PyCharm CE`, it was made to become a powerful Python IDE, and that's what you need.

So ... what's the better solution ?

Don't force one thing do more than one job, if you want more, create or find a new thing which should be made to do that job.

## What does it bring to you ?

* `xserver-xorg` as the graphics manager.
* `xinit` as the window manager bootstraptor (one more display manager is not nessesary here).
* `i3` as the window manager.
* `inkscape` as the vector graphics editor.
* `chrome` as the browser.
* `jdk8`
* `vim` as the text editor.
* other stuffs

The system only takes about 78MB of RAM at startup. With 4GB of RAM, you will feel so comfortable even the system's running `chrome` with a bundle of tabs, `android-studio` and 1 or 2 android emulator(s).

## How does it look like ?

![Screenshot 1](https://lh3.googleusercontent.com/QNVX5KH2fE2-RTsp8mUwhoDBTzMuOBAnU7xgz28ArBSGxCCz1dluKEr3xYQyQugoCJy-q1Qk-HQOWuZBB-PTXU1Bh7z7xK4gQUJM5VsXJZHKJnIp104Hn9Z1C8wIxfFh_vRHxv8trFbpEifY81lfl5ira3_0VC8OBBxZ_UBFa8rIj1iAMwjsIZ9QtPLXieqk0LzeGVd13H5-mmlJM2hWqmDZB2wjHnKaT_cTqIFgf2dJKr9_wXKeYOCn37iilsCLFBrVikzeBejEaypjAZW_DigzVM0owOvrIX9LOR1yPnz2UNWmsMCYzriC2GHzkCEJFa4FXFb2r31hjL3FYDmpB7A7NNP_aajItl6_BscqzQH6GUvunm6XT9m1R6EyP9w_SSaIT7KE73lbiKgTOAG4KQy5JMZtz5JGtNWtKh5H3wAhOGYFOg_ejGLjbHUYGL1KRS6SlbuK8cWSVA1x25feiAHiQRAaIv50oIrCShid8NUD9osg9kHu6VpzUYtNDskIxMW21So9vXL9wFpGhQBGgUK22wJ9L30Z8urn4bCkWJA=w1259-h707-no)

![Screenshot 2](https://lh3.googleusercontent.com/g8bITQ3rQbipYiSUBfYYLKQDtZjnb-sTGmqGGQNiUoGFsNjX_x31o6hGUMO0puvDgwHpv3aQUQTmhmdV_Mma7JIpSiltbXZqhHfTdW5KxDbi5DqKuZJokQ_EvNfcHBCcGu8P3csBiVfbnI7LuT59l3LifUHWivZu0T_LTTgWRT3fQYt1ye5Ze9JxdUl14iNYWXDDSDQVAplsB4ABNQ8A9Wj4eYLm30UiNFDYb_sfuNQvHqEPbU2FJ7eZqIIV5kgO1dK4Zs_vfj2QoEJKHluplK1CvdL4iUqsl_4tkEeWtkuvDR6YyeKfHO0JnOXR9IrgirGNxjx6JXExx7ZhJRomXCFWLdN4wtQjXo0d0LzzIhDV6QDLl_4B22LNFj5eUDIeOVHbkPeP5tcw3_A5yuXZSYKu23QC5j1dkxri72iTNv1f9i-XeYrxR5jzJWhToV6WMGZM2NrRsc6C-V-44L4wWYG726izuLNYEBFTzWYyH8G6jkUZdQZfqZdkALGMAz1BOiOz3VP1ZgZsFclSos1Bp4pxOmBZbPo7Bh9Oobs2RSk=w1189-h668-no)

## How to make it ?

* Install [Unetbootin](http://unetbootin.github.io/).
* Use `Unetbootin` to create a bootable USB stick with `Ubuntu 14.04 NetInstall x64` option.
* Use the USB stick to install Ubuntu on the hard disk or the USB stick itself. You'll be asked to choose some window manager and some package bundles , don't choose any of this list:
![don't choose any of this list](http://i.stack.imgur.com/Nu44s.jpg)
* After the above process finished and the system rebooted, install git by running `sudo apt-get install git`.
* Clone this repo to your home directory `/home/<your-username>`.
* Be sure you're in the home directory, run the setup `sudo chmod a+x ./minimal-ubuntu-setup.sh && ./minimal-ubuntu-setup.sh`
* Done!

## Clone the system to another computer

**Note:** Below steps requires you installed the system on the USB stick in the above 3rd step

**Note:** You need at least basic knowledge of GRUB first.

**Note:** The current OS is runnning on the new computer will be not affected.

You should be in the system that booted from the USB stick now. Check the partition id where the system was installed to:

`sudo fdisk -l`

I assume that it's `/dev/sdb1`.

Next, you need to create a new ext4 partition on the hard disk of the new computer. To do this, you can use `fdisk`(Linux) or `Minitool Partition Wizard` (Windows). I assume the new partition at `/dev/sda6`.

Next, clone the system in the USB to the new partition in the new computer:

`dd if=/dev/sdb1 of=/dev/sda6 conv=notrunc`

Because I cloned so `/dev/sdb1` and `/dev/sda6` has the same UUID now. We need to change it.

Generate a new UUID:

`uuidgen`

Change `/dev/sda6`'s UUID:

`sudo tune2fs /dev/sda6 -U <new-uuid>`

Next, we need to install GRUB on the hard disk of the new computer:

`sudo grub-install /dev/sda`

Now, you need to ensure all partition IDs and UUIDs are correct in /boot/grub/grub.cfg.

To list all UUIDs of partitions:

`ll /dev/disk/by-uuid`


**Ref:** [Resize the new partition after cloning](http://askubuntu.com/questions/173907/when-cloning-ext4-partition-with-the-dd-command-to-a-bigger-partition-free-spa)

**Ref:** [Don't clone a bigger partition to a smaller partition](http://askubuntu.com/questions/409204/how-to-clone-to-a-smaller-harddisk)
