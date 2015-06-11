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
  command => "puppet module install puppetlabs-vcsrepo",
  require => Package['puppet']
}

vcsrepo { '/opt/unicore/puppet-manifests':
  ensure   => latest,
  provider => git,
  source   => 'https://github.com/unicore-life/puppet-manifests.git',
  revision => 'master',
  require  => Exec['exec.install_vcsrepo_puppet_module']
}

cron { 'puppet-apply':
  ensure  => 'present',
  command => '/usr/bin/puppet apply /opt/unicore/puppet-manifests/common --logdest syslog',
  minute  => ['30'],
  target  => 'root',
  user    => 'root',
}

