# my_ssh_doc

https://www.digitalocean.com/community/tutorials/ssh-essentials-working-with-ssh-servers-clients-and-keys

### package
sudo apt install openssh-client
sudo apt install openssh-server

### doc
man sshd_config

### global config
/etc/ssh/sshd_config

### make a backup
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original
sudo chmod a-w /etc/ssh/sshd_config.original

### testing sshd config file
sudo sshd -t -f /etc/ssh/sshd_config

### adding banner to sshd_config
Banner /etc/issue.net

### applying changes
sudo systemctl restart sshd.service

ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "john@example.com"
ssh-copy-id username@remotehost
chmod 600 .ssh/authorized_keys
ssh-import-id <username-on-remote-service>
  
### Hardening a Server

/etc/ssh.sshd_config
  
change port
disable root access
Permit root login = no
disable password authentication = 0
limit allow user
systemctl restart ssh
  
X11Forwarding yes
ssh -X username@remote_host

ssh -f -N -L 8888:your_domain:80 username@remote_host  
ssh -L your_port:site_or_IP_to_access:site_port username@host
  
Host *
    ForwardX11 no
		ServerAliveInterval 120

  Host testhost
    HostName your_domain
    ForwardX11 yes
    Port 4444
    User demo