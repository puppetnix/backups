# Backups Puppet Module
This module install script for local full and incrimental backups and sync local backup to s3.


### Authors
* Artem Kobrin <kobrin.artem@gmail.com>

### Support OS
* Ubuntu 
* Centos 

## Usage


```puppet
class { 'backups':
  backup_dir           => '/Backups',
  include_backup_dir   => ['/etc','/root'],
  exclude_backup_dir   => ['/root/tmp','/root/cache'],
  time_backup          => '[1,0],  # at 1:00 o'clock 
  access_key           => '<access_key>',  # aws access key
  secret_key           => '<secret _key>'   # aws secret key
  s3bucket             => 's3://pica8'  # s3 bucket
  syncfolder           => '<new_server>'  # the variable will set as hostname if you don't set the variable
  enables3sync           => true
}
```


### backup script
```bash
/root/bin/backup.sh 
SYNOPSIS:
  backup.sh [COMMAND]

DESCRIPTION:
  backup.sh is a script to backup, list and restore files by using duplicity.

COMMANDS:
    backup.sh backup|bkp
	Start backing up.

    backup.sh list|ls
	Lists the files currently backed up in the archive.

    backup.sh status|stat|st
	Summarize the status of the backup repository by printing
	the chains and sets found, and the number of volumes in each.

    backup.sh verify|vrf
	Enter verify mode.

    backup.sh restore|rre path_to_be_restored [Restore time. Example: 2011-01-24T11:24:00]
	Enter restore mode.
	path should be given relative to the root of the directory backed up.

    backup.sh nixverify|nixver
```
