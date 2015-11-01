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

![Screenshot 1](https://lh3.googleusercontent.com/JdWEKX_NwZOwBVP0LkggjBLG7Nq_6qbwl8USj1ZAGGCyzJL2LVsFdZ2LY1Shk3CWuakqYgMcSZ17hrreZHzhv5Grtlv8ahtFnsCAcY8BUH9vrr-FlCF-oCR4WU1blMhRGGK1emYZTIsYNzhMf42id7_jS0N78Fiv7cRA95rLYHENulkuCN38SpMxZ-rfGL5mc5Qf3q7Tiox_R5rtDCHLSQlMZSpkV_h1YS5oOW6UfYVVnJkU3kS8WvpvDIK5I472fygM-ZbUJzYCQOfjHbdBDOCYTHJatxfUJ0dzMbdNEHvWCQ7v72YnwdU2GFMTWz9KvWXQTFtJHibmmqHddj6X_BcoOWXDGid0kx3AI-hxN2cnxkASnNclSBR8CnKABm8MxNzKPzXrTdR_3lthM-kCHe0jqCqUTfqntaeABAi7js1Oddhqr88jaJgK4u0mEKaAi2iZ4dK6pcJ9FDhpjHnXMojLBxn7E3dIITGrKkn9GQ81zuw5_HI18uMqM0PGrntLz11eLr262_KoVaokBR6WiFTYOmdEghscGx18eJO_v7c=w1115-h626-no)

![Screenshot 2](https://lh3.googleusercontent.com/SQFvRvlpuRie-GHelbnxrh8O4-6RDOce7mCnUnsMEFmyCc-0cFKSgKv_UdjZUwkFCMLqObepqaWs-b5J2N-YoYFmzYljkkosyywoosIrorQVFS1fGsdlOtiEVfmCJJe_z51gb7CQMwsRHtJwXL4Z4bTYof1EUzKHC3lZqMRFsRTV1bG9tVtdJvPitGIewVDp_ydKxP6TlAs2FKVZ0CsklJMOu4yPkIUc2qSZIFqkpc7Acc6VjsG7TvRmlYVvSZA6YKiwbMQAcNB7RkCPT0owGbmmAXx-QF2jSKm7KGhG1GrY5JNn-Vu1nv9AYMJpAsbe1ybMZDi8szo6ED14zDocHyd6mlpaESoJOoOa5HeweSYGRfkDHRYKYFHTM48J4HhpSWVfDAsUuF9DvKUkwGwEyMpNYVJMMseGB8hPEyv-vzGQQLHvWBkfNzIdIrlc7VfeFxr8EaxAiTk0sM3Cc2R-k0LRwXNTOm3dpKzufCAAKI_0ZpEdTx_iqhsQOH2zS4rKTOspc7gNSv4tGkLEziPeE9vWuswc3n5sXYI1HDd8xa8=w1115-h626-no)

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
