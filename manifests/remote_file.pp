# == Define: base::remote_file
#
# This resources wgets the file and manage it like a file resource
#
# === Parameters
#
# [*path*]
#   Where to download
# [*url*]
#   URL to download
# [*owner*]
#   To whom it should belong
#
# [*group*]
#   To which group it should belong
#
# [*mode*]
#   Target directory
#
# === Authors
#
# Romain Fihue  <romain.fihue@amadeus.com>
define base::remote_file ($path, $url, $owner = 'root', $group = 'root', $mode = '0644') {
  exec { $title:
    command => "wget -q ${url} -O ${path}",
    creates => $path
  } ->
  file { $path:
    ensure => present,
    owner  => $owner,
    group  => $group,
    mode   => $mode
  }
}

