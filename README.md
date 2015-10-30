## What's this ?

My minimal ubuntu setup script and dot files for the system.

The system includes:
* `xserver-xorg` as the graphics manager.
* `xinit` as the window manager bootstraptor (I found out that I don't need the display manager).
* `i3` as the window manager.
* `inkscape` as the vector graphics editor.
* `chrome` as the browser.
* `jdk8`
* `vim` as the code editor.
* other stuffs

I optimized the system setup to make it match the Unix philosophy `Do One Thing and Do It Well`, of course it's applied to the system, not to me, I love to do many things and do them well :)

The system only takes about 78MB of RAM at startup. With 4GB of RAM, you will feel so comfortable even the system's running `chrome` with a bundle of tabs, `android-studio` and 1 or 2 android emulator(s).

## How does it look like ?

![Screenshot 1](https://lh3.googleusercontent.com/QNVX5KH2fE2-RTsp8mUwhoDBTzMuOBAnU7xgz28ArBSGxCCz1dluKEr3xYQyQugoCJy-q1Qk-HQOWuZBB-PTXU1Bh7z7xK4gQUJM5VsXJZHKJnIp104Hn9Z1C8wIxfFh_vRHxv8trFbpEifY81lfl5ira3_0VC8OBBxZ_UBFa8rIj1iAMwjsIZ9QtPLXieqk0LzeGVd13H5-mmlJM2hWqmDZB2wjHnKaT_cTqIFgf2dJKr9_wXKeYOCn37iilsCLFBrVikzeBejEaypjAZW_DigzVM0owOvrIX9LOR1yPnz2UNWmsMCYzriC2GHzkCEJFa4FXFb2r31hjL3FYDmpB7A7NNP_aajItl6_BscqzQH6GUvunm6XT9m1R6EyP9w_SSaIT7KE73lbiKgTOAG4KQy5JMZtz5JGtNWtKh5H3wAhOGYFOg_ejGLjbHUYGL1KRS6SlbuK8cWSVA1x25feiAHiQRAaIv50oIrCShid8NUD9osg9kHu6VpzUYtNDskIxMW21So9vXL9wFpGhQBGgUK22wJ9L30Z8urn4bCkWJA=w1259-h707-no)

![Screenshot 2](https://lh3.googleusercontent.com/g8bITQ3rQbipYiSUBfYYLKQDtZjnb-sTGmqGGQNiUoGFsNjX_x31o6hGUMO0puvDgwHpv3aQUQTmhmdV_Mma7JIpSiltbXZqhHfTdW5KxDbi5DqKuZJokQ_EvNfcHBCcGu8P3csBiVfbnI7LuT59l3LifUHWivZu0T_LTTgWRT3fQYt1ye5Ze9JxdUl14iNYWXDDSDQVAplsB4ABNQ8A9Wj4eYLm30UiNFDYb_sfuNQvHqEPbU2FJ7eZqIIV5kgO1dK4Zs_vfj2QoEJKHluplK1CvdL4iUqsl_4tkEeWtkuvDR6YyeKfHO0JnOXR9IrgirGNxjx6JXExx7ZhJRomXCFWLdN4wtQjXo0d0LzzIhDV6QDLl_4B22LNFj5eUDIeOVHbkPeP5tcw3_A5yuXZSYKu23QC5j1dkxri72iTNv1f9i-XeYrxR5jzJWhToV6WMGZM2NrRsc6C-V-44L4wWYG726izuLNYEBFTzWYyH8G6jkUZdQZfqZdkALGMAz1BOiOz3VP1ZgZsFclSos1Bp4pxOmBZbPo7Bh9Oobs2RSk=w1189-h668-no)

## How to make it ?

1. Install `Unetbootin`.
2. Use `Unetbootin` to create a bootable USB stick with `Ubuntu 14.04 NetInstall x64` option.
3. Use the USB stick to install Ubuntu on the hard disk or the USB stick itself. You'll be asked to choose some window manager and some package bundles , don't choose any of this list:
![don't choose any of this list](http://i.stack.imgur.com/Nu44s.jpg)
4. After the above process finished and the system rebooted, install git by running `sudo apt-get install git`.
5. Clone this repo to your home directory `/home/<your-username>`.
6. Be sure you're in the home directory, run the setup `sudo chmod a+x ./minimal-ubuntu-setup.sh && ./minimal-ubuntu-setup.sh`
7. Done!

## Clone the system to another computer

**Note:** This way is only applied to the case that you installed the system to the USB stick itself in the 'How to make it ?' above. If you installed the system to the hard disk, find a way out by youself, it should be similar :)

**Note:** The good news is the OS which is running in the new computer won't be affected, it's still there, you can boot it normally. The bad news is you need the USB to boot the new computer to use the Ubuntu system, because Grub was installed the USB.

**Note:** I assume your system installed to /dev/sdb1 on the USB.

* On the new computer, you need create a new ext4 partition. I assume the new partition at /dev/sda6.
If it's running Windows, you can use Minitool Partition Wizard (free) to do that.
* Boot the new computer by the USB, you should be in the Ubuntu system now.
* Clone the system to the new partition by running: `dd if=/dev/sdb1 of=/dev/sda6 conv=notrunc`.
* Generate a new UUID for the new partition:
```
    # Generate a new UUID by running:
    uuidgen
    # Change partition UUID by running:
    sudo tune2fs /dev/sda6 -U <new-uuid>
```
* Update GRUP config in the USB by running: `sudo update-grub`.
* Ensure the partition UUIDs are right in /boot/grub/grub.cfg.
```
    #List partition UUIDs by running:
    ll /dev/disk/by-uuid
```

**Note:** You need some time to figure out what the *beep* in /boot/grub/brub.cfg.

**Note:** There're a lot WTF stuffs in this step. Keep calm and you will get it. I will add more document in the future.


**Ref:** [Resize the new partition after cloning](http://askubuntu.com/questions/173907/when-cloning-ext4-partition-with-the-dd-command-to-a-bigger-partition-free-spa)
