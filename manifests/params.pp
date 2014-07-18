class backups::params{

  case $::osfamily {

    Debian, Redhat: {
      $backup_dir = '/Backups'
      $include_backup_dir = ['/etc','/root']
      $exclude_backup_dir = []
      $time_backup = [1,0]
    }

    default: {
      err("Module backups is not supported on ${::operatingsystem}")
    }

  }

}
