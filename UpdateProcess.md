Sofware Update Process:

Firewall Pfsense
Source: https://docs.netgate.com/pfsense/en/latest/install/upgrade-guide.html
Source: https://docs.netgate.com/pfsense/en/latest/install/upgrading-pfsense-software-installations.html
Source: https://docs.netgate.com/pfsense/en/latest/install/upgrade-troubleshooting.html
Source: https://docs.netgate.com/pfsense/en/latest/backup/automatically-restore-during-install.html
source: https://docs.netgate.com/pfsense/en/latest/backup/autoconfigbackup.html

TODO: what about package config?
	AutoConfigBackup?


Warning: Do not upgrade packages before upgrading pfSense. Either remove all packages or leave the packages alone before running the update.

1. read realease note
1. backup config: Diagnostics > Backup/Restore
1. Warn users that the network will be unavailable during the upgrade
1. reboot (avoid confusion between boot and upgrade problem)
1. Remove package: System > Package Manager
1. upgrade: System > Update or via ssh # pfSense-upgrade


File Server Freenas
source: https://www.ixsystems.com/documentation/freenas/11.1/install.html

1. read release note
1. make a snapshot of the pool
1. backup config: System > General > Save Config
1. Warn users that the system will be unavailable during the upgrade
1. reboot (avoid confusion between boot and upgrade problem)
1. Stop all services: Services > Control Services
1. upgrade via GUI or ISO

# server checklist
Update firmware / BIOS / update everything I can.
Redo thermal paste. Try to neaten up internal cabling if possible.
Run a few cycles of MemTest. Run through Prime95 (or similar) overnight while keeping an eye on temps.
Also check the drives for bad sectors
I do is reset the nvram on the BIOS
check jumper position