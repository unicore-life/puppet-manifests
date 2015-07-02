cron { 'puppet-apply.plgrid-site':
  ensure  => 'present',
  command => '/usr/bin/puppet apply /opt/unicore/puppet-manifests/plgrid-site --logdest syslog',
  minute  => ['30'],
  target  => 'root',
  user    => 'root',
}
