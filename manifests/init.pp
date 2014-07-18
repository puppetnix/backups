# Class: backups
#
# This module manages backups
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class backups (
  $backup_dir        = $::backups::params::backup_dir,
  $include_backup_dir = $::backups::params::include_backup_dir,
  $exclude_backup_dir = $::backups::params::exclude_backup_dir,
  $time_backup = $::backups::params::time_backup,
  $access_key = '<access_key>',
  $secret_key = '<secret_key>',
  $s3bucket = 's3://pica8',
  $syncfolder =  $::fqdn,
  # $syncfolder =  $::instance_id,
  $enables3sync = true
  ) inherits backups::params {
  include backups::params, backups::install, backups::cron
}
