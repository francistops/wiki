#!/usr/bin/env bash


# basic command as reminder to use
\                                       # Escape character
ln -s -f                                # Create or overwrite symbolic link
unlink                                  # link Remove a link.
join file1 file2                        # append file together
tar	czf	file.tar.gz                     # create archive
tar	xzf	file.tar.gz                     # extract archive
wc                                      # count line word character
tail                                    # output the last line of a input
cut -d';' -f1,4	file                    # cut ouput base on arg
sort -nkr                                # sort output base on arg
uniq -u -d  -i -c                            # output repeated lines -u displays	not	repeated line -d displays only repeated
tr	string1	string2 < file              # Replace string1 characters occurrences within file by string2 characters (where the first character in string1 is translated into the first character in string2 and so on).
tr -s ' ' # replace multiple space with single
cat something | tr old new # typical use
sed 's/pattern1/pattern2/g' ficOrigine  # Replace pattern1 occurrence within file by pattern2. The s means <<substitute>> and the g means <<global replacment>> (Not only the first occurence). -e : allows combining multiple commands (use a -e before each command).-i : Edit files in-place. (Be carefull using that option)
sed 's/fox/bear/g' foo.txt -i|--in-place # Replace fox with bear and overwrite foo.txt
sed 's/fox/bear/gi' foo.txt              # Replace fox (case insensitive) with bear in foo.txt and output to console
sed	-n 5,10p file                       # Print	lines	5	to	10.
printf	%q	"$IFS" 		                # Print	the	arguments shell-quoted. >'	\t\n'
printf	"%.1f"	2.558                   # Specify the decimal precision. >2.6
printf	"%s\t%s\n"	"1"	"2"	"3"	"4"     # %s interprets the	associated argument literally as string. >1 2\n3 4
cmd > /dev/null # Discard stdout of cmd
cmd 2> file # Error output (stderr) of cmd to file
cmd 1>&2 # stdout to same place as stderr
cmd 2>&1 # stderr to same place as stdout
cmd &> file # Every output of cmd to file
ls exists 1> stdout.txt    # Redirect the standard output to a file
ls noexist 2> stderror.txt # Redirect the standard error output to a file
ls 2>&1 > out.txt          # Redirect standard output and error to a file
ls > /dev/null             # Discard standard output and error
cmd1 |& cmd2 # stderr of cmd1 to cmd2
cmd1 || cmd2 # Run cmd2 if cmd1 is not successful
cmd & # Run cmd in a subshell
grep -i # Case insensitive search
grep -r # Recursive search
grep -v # Inverted search
grep -o # Show matched part of file only
grep 'foo' /bar -C|--context 1              # Add N line of context above and below each search result
grep 'foo' /bar -v|--invert-match           # Show only lines that don't match
grep 'foo' /bar -c|--count                  # Count the number lines that match
grep 'foo' /bar -n|--line-number            # Add line numbers
egrep 'foo|bar' /baz -R                     # Use regular expressions
find /dir/ -name name* # Find files starting with name in dir
find /dir/ -user name # Find files owned by name in dir
find /dir/ -mmin num # Find files modifed less than num minutes ago in dir
find /path -iname foo.txt                  # Find a file with case insensitive search
find /path -type f -mtime +30 -delete      # Delete files that haven't been modified in 30 days
find /path -type f -name foo.txt           # Find a file
find /path -type d -name foo               # Find a directory
find /path -type l -name foo.txt           # Find a symbolic link
locate --ignore-case file # Find file (quick search of system index)
watch -n 5 'ntpq -p' # Issue the 'ntpq -p' command every 5 seconds and display output
time tree              # Time how long the tree command takes to execute
pkill -u $USER # kill $USER session
pkill -9 foo           # force shut down process by name. Sends SIGKILL signal.
tree -d                   # List directory tree
pushd foo                 # Go to foo sub-directory and add previous directory to stack
popd                      # Go back to directory in stack saved by `pushd`
read foo                   # Read from standard input and write to the variable foo
shutdown +5 "Cya later"      # Shutdown in 5 minutes
pidof foo              # Return the PID of all foo processes
CTRL+Z                 # Suspend a process running in the foreground
bg                     # Resume a suspended process and run in the background
fg                     # Bring the last background process to the foreground
fg 1                   # Bring the background process with the PID to the foreground
sleep 30 &             # Sleep for 30 seconds and move the process into the background
jobs                   # List all background jobs
jobs -p                # List all background jobs with their PID
lsof                   # List all open files and the process using them
lsof -itcp:4000        # Return the process listening on port 4000
at -l                      # List scheduled tasks
at -r 1                    # Remove task with ID 1
at now + 2 minutes         # Create a task in Vim to execute in 2 minutes
wget -O|--output-document foo.txt https://example.com/file.txt # Output to a file with the specified name
umask
id
tee
Access Control List (ACL)
getfacl file_name: to view the access control of file.
sefacl default:user:permission file_name: to modify the access control to file.
setfacl -m u:root:rwx File1.txt: will provide the read, write, execute access control to root user.
sudo openvpn --config Downloads/*.ovpn
nmap -sC -sV -oN scan.txt 10.10.18.58

# Using variables
variable=value                          # scope is restricted to the shell.
local variable=value                    # scope is restricted to the curly bracket
export variable=value                   # variable is available to shell and subprocesses
variable=$(command)                     # interpret command and store it inside variable
${#variable}                            # Length of	the value contained	by the variable.
${variable:N}                           # Keep the character of the value contained	by variable after the Nth.
${variable:N:length}                    # Substring	the	value contained	by variable from the Nth character to up to length specified.
${variable/pattern/string}              # The longest match of pattern against the variable value is replaced with string.
name="John"
echo "${name}"
echo "${name/J/j}"    #=> "john" (substitution)
echo "${name:0:2}"    #=> "Jo" (slicing)
echo "${name::2}"     #=> "Jo" (slicing)
echo "${name::-1}"    #=> "Joh" (slicing)
echo "${name:(-1)}"   #=> "n" (slicing from right)
echo "${name:(-2):1}" #=> "h" (slicing from right)
echo "${food:-Cake}"  #=> $food or "Cake"
declare -i foo=123     # Initialize an integer foo with 123
declare -r foo=123     # Initialize readonly variable foo with 123
echo ${foo:-'default'} # Print variable foo if it exists otherwise print default
unset foo              # Make foo unavailable to child processes
echo $?  # Print the last exit code

awk 'BEGIN { Initial command(s) } { by line command(s) } END { final command(s) }' # file $0 is	an	entire line. $1 is	the	first	field,	$2 the	second,	etc. By	 default,	 fields	 are	 separated	 by	 white	 space.	 Use the	-F option	 to	define	 the	input	 field	separator	 (can be	a	regular	expression). NF Number	of	fields	in	the	current	record. NR Ordinal	number	of	the	current	record. FNR Ordinal	number	of	 the	current	record	in	 the	current	file. -v	name=$var It	allows	to	pass	the	shell	 variable	$var to	awk	command.	The	variable	 is	known	as	name within	the	awk	command.
awk	'{	if	($2 ~	pattern)	arr[$0]++}	END	{	for	(i in arr){print	$i} }'	file # For	each	line	where	the	second	field	match the	pattern,	save	the	line	as	key	in	the	associative array arr and	increment	its	value.	At	the	end	print each	key	of	the	associative	array.	This	will	remove	the	duplicate	lines	that	have	matched.
awk	'FNR==NR{arr[$4]++;next}{	if($4 in	arr)print $0	}'	file1 file2 # Print	all	lines	of	file2 where	the	fourth	field matches	one	of	the	third	field	of	file1.


# Bash Shortcuts
CTRL-z # Sleep program
CTRL-a # Go to start of line
CTRL-e # Go to end of line
CTRL-u # Cut from start of line
CTRL-k # Cut to end of line
!abc # Run last command starting with abc
!abc:p # Print last command starting with abc
!$ # Last argument of previous command
!* # All arguments of previous command
^abc^123 # Run previous command, replacing abc with 123



mktemp -d|--directory            # Create a temporary directory
open foo.txt           # Open file in the default editor
type wget                                  # Find the binary
updatedb                                   # Update the index
netstat -i|--interfaces     # List all network interfaces and in/out usage
netstat -l|--listening      # List all open ports
mtr -r|--report -w|--report-wide -c|--report-cycles 100 example.com # Output a report that lists network traffic 100 times
nmap 0.0.0.0                # Scan for the 1000 most common open ports on localhost
nmap -sP 192.168.1.1/24     # Discover all machines on the network by ping'ing them
dig example.com             # Show complete DNS information
eval
set 
test
exec
wait
| xargs cmd # throws what pipe gave after cmd
iostat # shows I/O stats for blk devices.
sar # view sysstat logs for the day
blkid # locate/print block device attributes
/etc/logrotate.conf #edit logrotate settings
fsck -y -C /dev/sda* # file system check (y) yes (C) progress bar
netstat -lnp # show only (l)istening sockets (n)umeric (p)program, shows PID and name of program
iftop # top for open network connections
tmux             # Start a new session (CTRL-b + d to detach)
tmux ls          # List all sessions
tmux attach -t 0 # Reattach to a session


declare -i counter
counter=10
while [$counter -gt 2]; do
  echo The counter is $counter
  counter=counter-1
done

for i in {0..10..2}
  do
    echo "Index: $i"
  done

for filename in file1 file2 file3
  do
    echo "Content: " >> $filename
  done

for filename in *;
  do
    echo "Content: " >> $filename
  done

  echo "What's the weather like tomorrow?"
read weather

case $weather in
  sunny | warm ) echo "Nice weather: " $weather
  ;;
  cloudy | cool ) echo "Not bad weather: " $weather
  ;;
  rainy | cold ) echo "Terrible weather: " $weather
  ;;
  * ) echo "Don't understand"
  ;;
esac

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"
echo -e "$COL_RED This is red $COL_RESET"

pause() {
  local dummy
  read -s -r -p "Press any key to continue..." -n 1 dummy
}

set -euo pipefail
IFS=$'\n\t'

git log --oneline --graph --all

