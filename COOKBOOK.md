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

## How to change UUID of a partition ?

First, generate a new UUID:

`uuidgen`

Then change the UUID of the partition:

`sudo tune2fs /dev/<the-partition-id> -U <new-uuid>`

## How to count the size of a directory ?

Run:

`du -sh <the-directory>`

`-s` - print only the size of the directory, not it's inners.  
`-h` - print the size in human readable format (GB, MB, ...).  

## How to create a swap partition after installed Linux ?

Create a new partition (using fdisk maybe), then format it:

`mkswap /dev/<partition-id>`

The above command will print the new partition UUID as well. Add that UUID to `/etc/fstab` as:

`UUID=<that-uuid> none swap sw 0 0`

Restart the system.

To be sure the swap partition is in active, run:

`swapon -s`

Ref: [How do I add a swap partition after system installation?](http://askubuntu.com/questions/33697/how-do-i-add-a-swap-partition-after-system-installation)  
Ref: [How to Resize a Partition using fdisk](https://access.redhat.com/articles/1190213)  
Ref: [Wiki: Swap Partition](https://wiki.archlinux.org/index.php/Swap#Swap_partition)  
Ref: [HowTo: Check Swap Usage in Linux](http://www.cyberciti.biz/faq/linux-check-swap-usage-command/)  

## How to create a new cron job ?

Run:

`crontab -e`

Choose your favorite editor and add a new cron job entry, for example:

```
# check and kill overload process each 2 minutes
*/2 * * * * /home/vu/bin/kill_overload
```

Ref: [HowTo: Add Jobs To cron Under Linux or UNIX?](http://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/)  
Ref: [How to Run Cron Every 5 Minutes, Seconds, Hours, Days, Months](http://www.thegeekstuff.com/2011/07/cron-every-5-minutes/)

## How to upgrade system packages ?

There are 2 ways to upgrade system packages:

`sudo apt-get upgrade`

and

`sudo apt-get dist-upgrade`

The main different between `upgrade` and `dist-upgrade` is `upgrade` is a safer way, it only upgrades the version of packages, neither remove already installed packages or install new packages. Otherwise, `dist-upgrade` will check smartly package dependencies and maybe remove installed packages or install new packages if needed.

## How to upgrade a particular package ?

Run:

`sudo apt-get --only-upgrade install <package-name>`

For example:

`sudo apt-get --only-upgrade install google-chrome-stable`
