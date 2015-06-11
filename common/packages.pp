

$packageList = [ 'yum', 'git', 'mysql-server', 'mysql' ]

package { 
  $packageList: 
    ensure => installed
}

package { 'ca_policy_eugridpma':
  ensure  => latest,
  require => Yumrepo['eugridpma']
}

package { 'ca_PLGRID-SimpleCA':
  ensure  => latest,
  require => Package['plgrid-repos']
}

