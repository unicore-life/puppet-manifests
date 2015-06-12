$packageList = ['bash', 'expect', 'git', 'java-1.7.0-openjdk', 'java-1.8.0-openjdk', 'perl', 'puppet', 'python', 'subversion']

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

