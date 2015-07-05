class plgrid-unicore-core::resources-puppet {
  vcsrepo { '/opt/unicore/puppet-manifests':
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/unicore-life/puppet-manifests.git',
    revision => 'master',
    stage    => 'overture',
    require  => Exec['exec.install_vcsrepo_puppet_module']
  }

# Ensure that puppet vcsrepo module is installed:
#
  exec { 'exec.install_vcsrepo_puppet_module':
    command => 'puppet module install puppetlabs-vcsrepo',
    stage   => 'overture',
    require => Package['puppet']
  }
}