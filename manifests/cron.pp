class backups::cron{
  cron { backups:
    command => "nice -n 15 /root/bin/backup.sh backup &> /var/log/backup.log",
    user    => root,
    hour    => $time_backup[0],
    minute  => $time_backup[1],
  }
  if $backups::enables3sync == true {
    cron { s3sync:
      command => "nice -n 15 /usr/bin/s3cmd sync ${backup_dir}/ ${s3bucket}/${syncfolder}/  --delete-removed &> /var/log/sync_backup.log",
      user    => root,
      hour    => $time_backup[0]+1,
      minute  => $time_backup[1],
    }
  }
}
