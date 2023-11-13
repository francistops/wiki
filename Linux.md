# Linux CheatSheet

## TODO
system-wide changelog eg: better history
magic sys req key cheat cheat

## core knowledge
https://wiki.archlinux.org/index.php/Core_utilities
https://wiki.archlinux.org/index.php/File_permissions_and_attributes#Changing_permissions

## where to put stuff
~/.profile is the place to put stuff that applies to your whole session, such as programs that you want to start when you log in (but not graphical programs, they go into a different file), and environment variable definitions.
~/.bashrc is the place to put stuff that applies only to bash itself, such as alias and function definitions, shell options, and prompt settings. (You could also put key bindings there, but for bash they normally go into ~/.inputrc.)
~/.bash_profile can be used instead of ~/.profile, but it is read by bash only, not by any other shell. (This is mostly a concern if you want your initialization files to work on multiple machines and your login shell isn't bash on all of them.) This is a logical place to include ~/.bashrc if the shell is interactive. I recommend the following contents in ~/.bash_profile:

## Neat command
```bash
generate drive traffic to identify faulty HHD
while true; do dd if=/dev/disk/by-id/{idofthefaildrive} of=/dev/null; sleep 1; done

while true; do dd if=/dev/disk/by-id/scsi-35000c500100fc2ef of=/dev/null; sleep 1; done```

#remote file transfert
rsync -avn -P --human-readable --delete--stats --exclude .cache $HOME $USER@$hostname:/mnt/
scp -r $USER@$hostname:/source destination

find /home/$USER -name search -type f -print0

mv -vi ./*/*.mp4 ./

setxkbmap fr # changing keyboard layout for a session
smbclient //10.0.1.10/homeshare -U $USER
youtube-dl -x --audio-quality 0 --audio-format mp3 'URL'

mogrify -format png picturename.jpg
sudo dd if=inputfile.img of=/dev/sd? bs=4M && sync
sudo mkfs -t filesystem_type /dev/usbname
cut lsof ps sort lspci fsck md5sum set xprop env alias source

ip link set enp4s0 up                    
ip addr add 10.0.1.124/24 broadcast 10.0.1.255 dev enp4s0
ip route add default via 10.0.1.254      
ip addr flush dev enp4s0                 
ip route flush dev enp4s0                
ip link set enp4s0 down                  
ip link set enp4s0 up   

pacman -Rns <name>
pacman -Qn


GTK : numix-solarized
.Xresources

mkdir /example/{folder1, folder2}
groups <username>
ldd /bin/bash
```


```bash
### hardware
lspci
lsblk
fsck
partprobe --> make the kernel award of the new partitions

### process
ps -aux
pkill
xkill
xprop
lsof
ps -ef | grep httpd

### parsing
cut -d: -f7 /etc/passwd | sort | uniq -c
sort -t: -k3,3 -n /etc/group

### Alias
alias -p

### Dev
printenv SHELL
source .bashrc
md5sum
set
env

### Virtual Box
https://askubuntu.com/questions/816780/videos-not-playing

### Layout
setxkbmap fr # changing keyboard layout for a session ## how to make it permanent?

umount /dev/sd? && dd if=$inputfile.iso of=/dev/sd? bs=4M status=progress && sync

### music
youtube-dl -x --audio-quality 0 --audio-format mp3 '$URL'

### Search
find /home/$USER -name $search -type f -print0
find / -name core 2> /dev/null

### Screenshot
mogrify -format png $picturename.jpg


ln -s file link - symbolic link

whois domain - get whois dns record
dig domain - get dns record
dig -x host - reverse lookup host
wget file - download file -c continue -r recursive download
cat /proc/ - show HW info
du - show directory space usage
whereis app - show location of app
which app - show wich app will be run bt default
grep -r - search recursively in dir
locate file - find file
ps aux - process lot detail
jobs - show bg task
bg - background curent task
fg - foregroud curent task
tar s - archive ?
gunzip
w - list user curently login
finger - detail info on a user
alias - make command shortcut
apropos - search man page
awk - ?
bc - ?
cmp - ?
crontab -e - edite cron jobs
cut
sort -b Ignore leading whitespace -f Case insensitive sorting -k Specify the columns that form the sort key -n Compare fields as integer numbers -r Reverse sort order -t Set field separator (the default is whitespace) -u Output unique records only
uniq
wc

dtrace ?

sudo shutdown -h 09:30 "Going down for scheduled maintenance.
Expected downtime is 1 hour."

