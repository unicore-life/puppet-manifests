vcsrepo { '/opt/unicore/puppet-manifests':
  ensure   => latest,
  provider => git,
  source   => 'https://github.com/unicore-life/puppet-manifests.git',
  revision => 'master'
}

vcsrepo { '/opt/unicore/plgrid-idb-templates':
  ensure   => latest,
  provider => svn,
  source   => 'svn://svn.code.sf.net/p/unicore-life/code/plg-utils/plg-idb-templates/trunk/'
}
