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

## How to list biggest size files/directories in a directory ?

Run:

`du -h -t <size-threshold> -x <path-to-a-directory>`

Which:

`-h` - print human readable size format  
`-t <size-threshold>` - only print files/directories has bigger this threshold  
`-x` -- only count files and directories that in the same file system

A example of results:
```
202M	./.cache/google-chrome/Profile 1/Media Cache
263M	./.cache/google-chrome/Profile 1/Cache
464M	./.cache/google-chrome/Profile 1
464M	./.cache/google-chrome
466M	./.cache
68M	./.config/google-chrome/Profile 1/Extensions
91M	./.config/google-chrome/Profile 1/Application Cache/Cache
92M	./.config/google-chrome/Profile 1/Application Cache
251M	./.config/google-chrome/Profile 1
286M	./.config/google-chrome
286M	./.config
761M	.
```

## How to check free space of partitions ?

Run:

`df -h`

To check space usage, run:

`du -h --max-depth=1 <the-mount-point-of-partition>`

## How to install Steam and run it's games in a chroot environments ?

This guide workds with chroot environment of Ubuntu 14.04 amd64.

First you need a chroot environment and you're in there.

To install Steam, you're should be root right now, run:

```
dpkg --add-architecture i386
apt-get update
apt-get install lib32z1 lib32ncurses5 lib32bz2-1.0
apt-get install steam
```

Steam requires a non-root user to run, so add a new non-root user:

`useradd -m -G <username>`

Which:
`-m` - create user home directory.  
`-G` - create a group of the same name.  

Next, install `mesa-utils` package to help Steam recognize the graphics card:

`apt-get install mesa-utils`

Then add the non-root user to `video` user group:

`usermod -a -G video <username>`

That's it. Have fun with it.

## How to format a partition to ext4 ?

Run:

`sudo mkfs -t ext /dev/<partition-id>`

## How to fix the weird color scheme in Vim when run on root ?

Open `/etc/sudoers` as root and add this line below `Defaults env_reset`:

`Defaults env_keep += "COLORFGBG COLORTERM"`

## How to list processes that are opening a file ?

Run:

`lsof <path-to-the-file>`

Output sample:

```
>lsof /mnt
COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF  NODE NAME
bash    2033   vu  cwd    DIR    8,5     4096 19310 /mnt/ubuntu-system-snapshot
```

Ref: `man lsof`

## How to create a bootable clone USB from current Ubuntu system ?

**Find a USB**:

First, you need an USB stick has a capacity of at least your current system size. You can check you current system size by:

`df -h`

Sample output:

```
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda8       7.0G  1.4G  5.3G  21% /
none            4.0K     0  4.0K   0% /sys/fs/cgroup
udev            1.9G  4.0K  1.9G   1% /dev
tmpfs           388M  768K  387M   1% /run
none            5.0M     0  5.0M   0% /run/lock
none            1.9G   29M  1.9G   2% /run/shm
none            100M     0  100M   0% /run/user
```

Here the system size is 1.4G.

**Re-format the USB**:

From here, I suppose that the USB is `/dev/sdb`.

Delete all partitions in the USB and re-create an only one:

`sudo fdisk /dev/sdb`

Follow steps:

`p` to list all current partitions.  
`d` to delete all current partitions.    
`n` to create an only partition (leave all default values).  
`w` to save changes.  
`q` to quit fdisk.  

The only partition now is `/dev/sdb1`.

Format `/dev/sdb1` as ext4:

`sudo mkfs.ext4 /dev/sdb1`

**Clone the system**:

Mount `/dev/sdb1`:

`sudo mount /dev/sdb1 /mnt`

Clone the system:

`sudo rsync -avxAX /* /mnt --exclude={/dev/*,/proc/*,/sys/*,/tmp/*,/run/*,/mnt/*,/media/*,/lost+found}`

**Make the USB bootable**:

Install GRUB on the USB:

`sudo grub-install --force --no-floppy --boot-directory=/mnt/boot /dev/sdb`

Get UUID of `/dev/sdb1`:

`blkid`

Change UUID of the partition that is mounting to `/` in `/mnt/etc/fstab` to the UUID of `/dev/sdb1` by editing:

`sudo vim /etc/fstab`

Final step, we need to update GRUB config file:

```
sudo mount -B /dev /mnt/dev
sudo mount -B /dev /mnt/proc
sudo mount -B /dev /mnt/sys

sudo chroot /mnt bash
update-grub
```

Now the USB has the clone of your current system.
