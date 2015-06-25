# == Define: base::change_ownership
#
# This resources changes the ownership of a given file/folder
#
# === Parameters
#
#
# [*user*]
#   To whom it should belong
#
# [*group*]
#   To which group it should belong
# 
# [*directory*]
#   Target directory
#
# === Authors
#
# Romain Fihue  <romain.fihue@amadeus.com>
# Michael Mirschberg  <michael.hirschberg@amadeus.com>
define base::change_ownership ($user,$group,$directory) {
  exec { "/bin/chown ${user}:${group} ${directory}":
    unless => "/bin/sh -c '[ $(/usr/bin/stat -c %U,%G ${directory}) \
== ${user},${group} ]'",
  }

}
