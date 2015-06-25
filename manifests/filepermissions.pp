class base::filepermissions (
  ) {
  file { '/var/log/messages':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    audit   => [ owner, group, mode ],
  }

  file { '/var/log/kernel':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    audit   => [ owner, group, mode ],
  }

  file { '/var/log/cron':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    audit   => [ owner, group, mode ],
  }

  file { '/var/log/secure':
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
    audit   => [ owner, group, mode ],
  }
}

