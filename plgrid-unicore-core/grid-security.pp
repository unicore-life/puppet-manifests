package { 'ca_policy_eugridpma':
  ensure  => latest,
  require => Yumrepo['eugridpma']
}

package { 'ca_PLGRID-SimpleCA':
  ensure  => latest,
  require => Package['plgrid-repos']
}

package { 'fetch-crl':
  ensure  => latest,
  require => Package['epel-release']
}

service { 'fetch-crl-cron':
  ensure  => running,
  enable  => true,
  require => Package['fetch-crl']
}

#exec { 'exec.fetch-crl':
#  command => '/usr/sbin/fetch-crl -v',
#  require => Package['fetch-crl']
#}
