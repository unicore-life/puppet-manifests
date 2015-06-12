
cron { 'puppet-apply.common':
  ensure  => 'present',
  command => '/usr/bin/puppet apply /opt/unicore/puppet-manifests/common --logdest syslog',
  minute  => ['30'],
  target  => 'root',
  user    => 'root',
}

