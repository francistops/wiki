
# Note
i dont need to have a log(zil) or cache(l2arc) for home use ( create more overhead and im not accessing the same file over and over)

Create a guest account that all users will use or create a user account for every user in the network where the name of each account is the same as a logon name used on a computer. 
For example, if a Windows system has a login name of bobsmith, create a user account with the name bobsmith on FreeNAS. 
A common strategy is to create groups with different sets of permissions on shares, then assign users to those groups.

It is important to set the email address for the built-in root user account as important system messages are sent to the root user. 

https://forums.freenas.org/index.php?resources/hard-drive-troubleshooting-guide-all-versions-of-freenas.17/

smartctl -a /dev/ada2 -> view disk smart result 
smartctl -t long /dev/ada2 -> do self-test long 
sysctl kern.geom.debugflags=16 -> give permision to write to disk
diskinfo -v /dev/ada2 -> view information about the disk 
dd if=/dev/zero of=/dev/ada? bs=$stripesize count=1 seek=$sector conv=noerror,sync # bs= stripesize(find with diskinfo) seek= sector(find with smartctl)

eg. dd if=/dev/zero of=/dev/ada0 bs=512 count=1 seek=1253556992 conv=noerror,sync 

zpool scrub poolX

# Syncthing install on Truenas scale

Synthing: advance> folder> Ignore Perms

# Synthing  install on client