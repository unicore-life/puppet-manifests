package { ['unicore-gateway', 'unicore-unicorex', 'unicore-uftpd']:
  ensure => installed,
  require => Package['plgrid-repos']
}

service { 'unicore-gateway':
  enable  => true,
  require => Package['unicore-gateway']
}

service { 'unicore-unicorex':
  enable  => true,
  require => Package['unicore-unicorex']
}

service { 'unicore-uftpd':
  enable  => false,
  require => Package['unicore-uftpd']
}
