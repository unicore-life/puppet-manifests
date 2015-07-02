vcsrepo { '/opt/unicore/puppet-manifests':
  ensure   => latest,
  provider => git,
  source   => 'https://github.com/unicore-life/puppet-manifests.git',
  revision => 'master',
  require  => Exec['exec.install_vcsrepo_puppet_module']
}

vcsrepo { '/opt/unicore/plgrid-idb-templates':
  ensure   => latest,
  provider => svn,
  source   => 'svn://svn.code.sf.net/p/unicore-life/code/plg-utils/plg-idb-templates/trunk/'
}

# Ensure that puppet vcsrepo module is installed:
#
exec { 'exec.install_vcsrepo_puppet_module':
  command => 'puppet module install puppetlabs-vcsrepo',
  require => Package['puppet']
}
