# == Class: base::base
#
# This class takes care of basic OS setup, for the moment
# it's ntp setup, mcollective setup and puppet setup.
# Each one configures packages, service, users and so on ...
#
# === Parameters
#
# No parameters needed
#
# === Variables
#
# No variables needed
#
class base {
  #$puppet_env = $::puppetenv
  #require sysusers
  #include yumrepos
  include base::ntp
  # include mcollective
  #class {'mcollective': puppet_env => $puppet_env, }
  # include puppet
  #class {'puppet': puppet_env => $puppet_env, }
  #include base::root_core
  # include base::partition
  #include base::hierafacts
  #include centrify
  #include dracut
  #include sightline # Default to installed
  #include openssh
  #include sshsetup
  #include postfix
  #include pythonmodules
  # Testing jenkins
  #include rsyslog
  #include fusionio
  #include base::filepermissions
  #include gemrc

  # class {'sightline':
  #       ensure => 'absent'  # Will Uninstall it
  #       }
  
  # update hostsfile from DZ depot
  #include base::hostsfile

  #unless $::operatingsystem == 'CentOS' {
  #  include base::s_check
  #}

  #if str2bool($::is_virtual) {
  #  include vmtools
  #}

  #include snmp

  if $::manufacturer == 'HP' and $::osfamily == 'RedHat' {
    include spp
  }

  #include logrotate
  #include bash

  #grub::kernel_param { 'crash_kernel':
  #  param => 'crashkernel',
  #  value => '512M@0M'
  #}

  file { '/etc/facter/facts.d/environment.txt':
    ensure  => present,
    mode    => '0644',
    content => "environment=${environment}",
    noop    => false,
  }

  file { '/etc/facter/facts.d/role.txt':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    #content => template("${module_name}/puppetenv.erb"),
    noop    => false,
  }

  #motd::register { "Base": }
}
