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
class base::partition ($swap = false, $swap_size = '4G', $phys_var_log_size = '20G', $vm_var_log_size = '4G') {
  # Chooses the var_log size if virtual or physical (default to the smallest)
  $var_log_size = str2bool($::is_virtual) ? {
    true    => $vm_var_log_size,
    false   => $phys_var_log_size,
    default => $vm_var_log_size
  }

  # Creates a swap device if virtual or if you ask to
  #  if str2bool($::is_virtual) or $swap {
  #    logical_volume { 'swap':
  #      ensure       => present,
  #      volume_group => 'vg00',
  #      size         => $swap_size,
  #    }
  #
  #    exec { 'mkswap':
  #      command     => 'mkswap /dev/vg00/swap',
  #      refreshonly => true
  #    }
  #
  #    mount { 'swap':
  #      ensure  => present,
  #      name    => 'swap',
  #      device  => '/dev/mapper/vg00-swap',
  #      fstype  => 'swap',
  #      options => 'defaults'
  #    }
  #    Logical_volume['swap'] -> Mount['swap']
  #    Logical_volume['swap'] ~> Exec['mkswap']
  #  }

  # Creates var/log filesystem and mount it
  logical_volume { 'var_log':
    ensure       => present,
    volume_group => 'vg00',
    size         => $var_log_size
  } ->
  filesystem { '/dev/mapper/vg00-var_log':
    ensure  => present,
    fs_type => 'ext4',
    require => Logical_volume['var_log']
  } ->
  mount { 'var_log':
    ensure   => 'mounted',
    name     => '/var/log/',
    fstype   => 'ext4',
    device   => '/dev/mapper/vg00-var_log',
    options  => 'defaults',
    pass     => '2',
    dump     => '1',
    remounts => true
  }
}
