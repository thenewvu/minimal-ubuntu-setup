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

![screenshot-201511202313-0.png](https://lh3.googleusercontent.com/0G4RXpDcvGD87FlBYC7LC7-pSHxrk1l2haCfG3KGuEzeG6_dLDc9lVYOqfpCCdq2fDvxfulBcJ0It9gpN8jxbLakVkGjKdwPCJXGqp0-d_JwceD6CDYx-iyrtdiO6ISU9Yy4ajhadpLfKUyonYOndmEZfuoYaoBEVbxYQAnSN0rdYdOIWxFFWPoiWFL4TioTSPBHJD05HpBIZsIcCr0goXeB6KKp9YbgoF8vL2ATIOA7PfkeLWFoBtfT8rRdR0LpNMk2eLTc497FENWw5M5JTf3LfXHh2ly9eevVWvq1kJhTyYir-hZcUJ6ZB2bHQlx5CRWSaxFp1J7YJZfpLrrHrgfLW0RuNbeK9BiRyea_-Ehv7PGWkrtq_L-sOAr7SHJCjCNocLCuEcQmJo9OdPuTfSAV7-Np6xZQkcB80BnhvhlK064TDaBf4-ox7XW6eK8IsWLaQjTLZBkqgvEN-OV9ebONd0NH3GE3X7K9168EjuJX5UlU78p9lSJnQBtCd0v7puN_JxiGDultTojFh-MevugXwYsiVR7HEV7IPObvIYg=w1005-h565-no)  

![screenshot-201511202313-1.png](https://lh3.googleusercontent.com/khZht1ajha9hXX2T59dsdZbMEve28uJkd4J3zirqAk-F83NHqyrab708FmZ_rdVvwEwrJmMB2m2q9iUFmOCTktzm9i19pMyVsCHJ7Rfs2GDcbpjlc2VRD4oIOcqDyKOdDIRl8eZVlWdpQsDtg2CF6Ob1FLK86Ta7qI-fM1S0mveC9tHqol2b7aYj_pEumUvbcW0A5_4nWDL6W8ftntQaFIUVBiz0_OnWAfIEa6eNaffd-y47j-xwJU77W6u0nuFHkVJpAksHkUB-8kp94zqfpFIgn9zzz3uqv1FS9H4GzMfSCd-1cgp-vv41nn39eXw2w-WuPVvTpk5ryvsQlWAexd1E4slUhsogY6ReBjFC87mAMepXXCFg9UzAF9aRiiBMLr8SSxEoQq_Yl_UZuSzqqlTO999FmlYOoKhMFIVhTgA20c3zzq9wrffz-YNcJUCXBWDRAqi6_sd30SFwH-OGI-HM5nS5lZuFW-c97L08nU-Gsc0Z76vsC7OLGodCu7II3hIW0dS4v-4uVYDihQ3w-KQl_lTD-SMxmgWGjMVU3nU=w1005-h565-no)

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

Next, update the GRUB configuration in the USB:

`sudo update-grub`

Make sure all partition IDs, UUIDs are correct in `/boot/grub/grub.cfg` (IMPORTANT!, the system is not bootable if something wrong). To list all UUIDs of partitions:

`ll /dev/disk/by-uuid`

Reboot and choose the GRUB menu entry of the Ubuntu system installed on the hard disk.

To be sure that you choosed the Ubuntu system on the hard disk, after the system booted up, run `mount` you should see something like this:

`/dev/sda6 on / type ext4 (rw,errors=remount-ro)`

Right now, you can only boot the system on the hard disk by the USB stick, because GRUB installed on the USB, not on the hard disk.

Next, we need to install GRUB on the hard disk of the new computer:

`sudo grub-install /dev/sda`

Make sure all partition IDs, UUIDs are correct in `/boot/grub/grub.cfg` (IMPORTANT!, the system is not bootable if something wrong).


**Ref:** [Resize the new partition after cloning](http://askubuntu.com/questions/173907/when-cloning-ext4-partition-with-the-dd-command-to-a-bigger-partition-free-spa)

**Ref:** [Don't clone a bigger partition to a smaller partition](http://askubuntu.com/questions/409204/how-to-clone-to-a-smaller-harddisk)


## TODOs

* Find a way to keep changes in /boot/grub/grub.cfg from overwritten after update kernel. ref: [Is it possible to edit grub.cfg?](http://askubuntu.com/questions/437323/is-it-possible-to-edit-grub-cfg)
* [Learn more about GRUB](http://www.dedoimedo.com/computers/grub-2.html)
* [Grub Customizer](https://launchpad.net/grub-customizer)
* [How to: Create a Customized GRUB2 Screen that is Maintenance Free.](http://ubuntuforums.org/showthread.php?t=1542338)
