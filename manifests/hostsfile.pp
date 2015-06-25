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
class base::hostsfile ($source = 'http://172.24.85.39/DZB/COMMON/hosts', $enable = true) {
  
  remote_file { 'hosts':
    path => '/etc/hosts',
    url  => $source,
    mode => '0644'
  }
}