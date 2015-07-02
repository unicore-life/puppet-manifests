$rhelVersion = '6'

Exec {
  path => [ '/bin/', '/usr/bin/' ]
}

package { 'puppetlabs-release':
  provider        => rpm,
  ensure          => installed,
  install_options => ['--nodeps'],
  source          => "http://yum.puppetlabs.com/puppetlabs-release-el-${rhelVersion}.noarch.rpm"
}

package { ['git', 'puppet']:
  ensure => installed
}

exec { 'exec.install_vcsrepo_puppet_module':
  command => 'puppet module install puppetlabs-vcsrepo',
  require => Package['puppet']
}

exec { 'exec.install_mysql_puppet_module':
  command => 'puppet module install puppetlabs-mysql',
  require => Package['puppet']
}

cron { 'puppet-apply.plgrid-site':
  ensure  => 'present',
  command => '/usr/bin/puppet apply /opt/unicore/puppet-manifests/plgrid-site --logdest syslog',
  minute  => ['30'],
  target  => 'root',
  user    => 'root',
}