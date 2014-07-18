class backups::install{
  package { ['duplicity','s3cmd']:
    ensure => installed,
  }
  file { '/root/bin':
        ensure  => directory,
        require => Package['duplicity'],
      }
  file { '/root/bin/backup.sh':
        ensure  => file,
        require => File['/root/bin'],
        content => template("backups/backup.sh.erb"),
        mode    => '0755'
      }
  file { '/root/.s3cfg':
        ensure  => file,
        require => Package['s3cmd'],
        content => template("backups/s3cfg.erb"),
        mode    => '0755'
      }
}
