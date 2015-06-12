
service { 'fetch-crl-cron':
  ensure  => running,
  enable  => true,
  require => Package['fetch-crl']
}

