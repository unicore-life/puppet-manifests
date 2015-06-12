$packageList = [ 'yum', 'git', 'subversion', 'puppet' ]

package { 
  $packageList: 
    ensure => installed
}

package { 'ca_policy_eugridpma':
  ensure  => latest,
  require => Yumrepo['eugridpma']
}

package { 'fetch-crl':
  ensure  => latest,
  require => Package['epel-release']
}

package { 'ca_PLGRID-SimpleCA':
  ensure  => latest,
  require => Package['plgrid-repos']
}

