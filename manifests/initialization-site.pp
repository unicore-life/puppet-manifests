$rhelVersion = '6'

Exec { path => [ '/bin/', '/usr/bin/' ] }

package { 'puppetlabs-release':
  provider        => rpm,
  ensure          => installed,
  install_options => ['--nodeps'],
  source          => "http://yum.puppetlabs.com/puppetlabs-release-el-${rhelVersion}.noarch.rpm"
}

package { ['git', 'puppet']: ensure => installed }

exec { 'exec.install_module_puppetlabs-ntp':
  command => 'puppet module install puppetlabs-ntp',
  require => Package['puppet']
}

exec { 'exec.install_module_puppetlabs-mysql':
  command => 'puppet module install puppetlabs-mysql',
  require => Package['puppet']
}

exec { 'exec.install_module_puppetlabs-vcsrepo':
  command => 'puppet module install puppetlabs-vcsrepo',
  require => Package['puppet']
}

vcsrepo { '/opt/plgrid/puppet-manifests':
  ensure   => latest,
  provider => git,
  source   => 'https://github.com/unicore-life/puppet-manifests.git',
  revision => 'master',
  require  => Exec['exec.install_module_puppetlabs-vcsrepo']
}

#cron { 'puppet-apply.plgrid-unicore-site':
#  ensure  => 'present',
#  command => '/usr/bin/puppet apply /opt/unicore/puppet-manifests/plgrid-unicore-site/ --logdest syslog',
#  minute  => ['30'],
#  target  => 'root',
#  user    => 'root',
#}
