cron { 'puppet-apply.plgrid-unicore-site':
  ensure  => 'present',
  command => '/usr/bin/puppet apply /opt/unicore/puppet-manifests/plgrid-unicore-site/ --logdest syslog',
  minute  => ['30'],
  target  => 'root',
  user    => 'root',
}
