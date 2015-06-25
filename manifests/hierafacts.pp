class base::hierafacts {
  $nodeUUID = hiera("nodeUUID", "Not Found")
  $assetId = hiera("assetId", "Not Found")
  $phaseLevel = hiera("phaseLevel", "Not Found")
  $app = hiera("app", "unknown")

  #  $phaseLevel = hiera("phaseLevel")

  file { '/etc/facter/facts.d/nodeUUID.txt':
    ensure  => 'present',
    mode    => '0644',
    content => "nodeUUID=${nodeUUID}",
    noop    => false
  }

  file { '/etc/facter/facts.d/assetId.txt':
    ensure  => 'present',
    mode    => '0644',
    content => "assetId=${assetId}",
    noop    => false
  }

  file { '/etc/facter/facts.d/phaseLevel.txt':
    ensure  => 'present',
    mode    => '0644',
    content => "phaseLevel=${phaseLevel}",
    noop    => false
  }

  file { '/etc/facter/facts.d/app.txt':
    ensure  => 'present',
    mode    => '0644',
    content => "app=${app}",
    noop    => false
  }
}
