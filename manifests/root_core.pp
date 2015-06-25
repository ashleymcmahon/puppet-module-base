# == Class: base::root_core
#
# This class configures the root core file size
# === Parameters
#
#
# === Variables
#
# No variables needed
#
# === Authors
#
# Romain Fihue  <romain.fihue@amadeus.com>
#
class base::root_core {
  limit_conf { 'root_core':
    domain => 'root',
    type   => '-',
    item   => 'core',
    value  => '2097152',
  }
}
