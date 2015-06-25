class ntp {
  package { 'ntp':
    provider => zypper,
    ensure => installed,
    name   => $package_name,
  }

}
