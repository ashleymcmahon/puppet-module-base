# == Class: base::partition
#
# This class takes care of OS partitioning (swap & var_log)
#
# === Parameters
#
# No parameters needed
#
# === Variables
#
# No variables needed
#
# === Authors
#
# Romain Fihue  <romain.fihue@amadeus.com>
#
class base::s_check ($source = 'http://172.24.85.39/DZB/COMMON/s_check', $enable = true) {
  motd::register { "S_check": }

  remote_file { 's_check':
    path => '/etc/init.d/s_check',
    url  => $source,
    mode => '0755'
  }

  service { 's_check':
    name   => 's_check',
    enable => $enable,
  }
}
