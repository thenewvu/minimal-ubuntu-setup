## How to set custom DNS servers ?

Open `/etc/resolvconf/resolv.conf.d/base` then add new DNS servers, for example:

```
nameserver 8.8.8.8
nameserver 8.8.4.4
```

Then update resolvconf:

`sudo resolvconf -u`

Ref: `man resolvconf`  
Ref: [How do I set my DNS on Ubuntu 14.04?](http://unix.stackexchange.com/questions/128220/how-do-i-set-my-dns-on-ubuntu-14-04)

## Why does “Waiting for network configuration” message show up on Ubuntu boot

The message is showed up when one of `auto` interfaces which defined in `/etc/network/interfaces` is not available at the boot time, therefore the system waits for it.

There are at least 2 solutions for this.

One, remove the `auto` interface, we can turn it up and use it after the system booted up.  
Two, reduce the waiting time in `/etc/init/failsafe.conf` follow this [link](http://tech.pedersen-live.com/2012/05/disable-waiting-for-network-configuration-messages-on-ubuntu-boot/).

Ref: `man interfaces`  
Ref: [failsafe.conf's 30 second time out is too low](https://bugs.launchpad.net/ubuntu/+source/upstart/+bug/839595)

## How to allow non-root users to mount a particular partition

Get the UUID of the partition will be mounted:

`ll /dev/disk/by-uuid`

Open `/etc/fstab` and add:

`UUID=<the-uuid> /mnt/<the-name-of-partition>        ext4    user,rw,exec,noauto 0`

Update new `fstab` by:

`mount -a`

To mount:

`mount /mnt/<the-name-of-partition>`

or

`mount /dev/<the-partition-id>`

Ref: `man fstab`

## How to add new fonts ?

Copy new fonts to `~/.fonts/`, for example:

`~/.fonts/truetype/source-code-pro/SourceCodePro-Black.ttf`

Then reload font cache:

`fc-cache -fv`

To list available fonts:

`fc-list`