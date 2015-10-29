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
3. Use the USB stick to install Ubuntu on the hard disk or the USB stick itself.
4. Install git by running `sudo apt-get install git`.
5. Clone this repo to your home directory `/home/<your-username>`.
6. Be sure you're in the home directory, run the setup `sudo chmod a+x ./minimal-ubuntu-setup.sh && ./minimal-ubuntu-setup.sh`
7. Done!
