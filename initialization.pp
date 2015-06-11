$rhelVersion = '6'
$epelVersion = '6-8'

Exec { 
    path => [ '/bin/', '/usr/bin/' ] 
}

$manifestsDirectory = '/opt/unicore/puppet-manifests'
$manifestsRepositoryUrl = 'https://github.com/unicore-life/puppet-manifests.git'

package { 'puppetlabs-release':
  provider        => rpm,
  ensure          => installed,
  install_options => ['--nodeps'],
  source          => "http://yum.puppetlabs.com/puppetlabs-release-el-${rhelVersion}.noarch.rpm"
}

package { 'epel-release':
  provider        => rpm,
  ensure          => installed,
  install_options => ['--nodeps'],
  source          => "http://download.fedoraproject.org/pub/epel/${rhelVersion}/x86_64/epel-release-${epelVersion}.noarch.rpm"
}

package { ['git', 'puppet']:
  ensure => installed
}

exec { 'install_vcsrepo_puppet_module':
  command => "puppet module install puppetlabs-vcsrepo",
  require => Package['puppet']
}

vcsrepo { '/opt/unicore/puppet-manifests':
  ensure   => latest,
  provider => git,
  source   => 'https://github.com/unicore-life/puppet-manifests.git',
  revision => 'master',
  require  => Exec['install_vcsrepo_puppet_module']
}

cron { 'puppet-apply':
  ensure  => 'present',
  command => '/usr/bin/puppet apply /opt/unicore/puppet-manifests/common --logdest syslog',
  minute  => ['30'],
  target  => 'root',
  user    => 'root',
}

