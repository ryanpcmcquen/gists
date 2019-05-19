Go here and download the latest LTS release:
http://www.ubuntu.com/download/desktop

Then in terminal, find out what disk is your usb thumb drive:

    $ lsblk
    NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
    sda      8:0    0 931.5G  0 disk 
    └─sda1   8:1    0 931.5G  0 part /
    sdb      8:16   1   3.8G  0 disk 
    └─sdb1   8:17   1   844M  0 part 

Looks like sdb (judging by the size), so that means we can write to it using `/dev/sdb`, like so:

    $ dd if=ubuntu-14.04.3-desktop-amd64.iso of=/dev/sdb; sync

Remove the usb drive, reboot and install. BOOM.

If you want to be really cool, you could use `cat` instead of `dd` but you may need to be root(`#`) on some distros:

    # cat ubuntu-14.04.3-desktop-amd64.iso > /dev/sdb; sync

In this scenario, `cat` is faster than `dd`, and uses less resources.

There is also the 'cheater' `sudo` way (for *buntu's):

    $ sudo sh -c 'cat ubuntu-14.04.3-desktop-amd64.iso > /dev/sdb; sync'