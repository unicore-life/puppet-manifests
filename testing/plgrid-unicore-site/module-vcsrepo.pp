vcsrepo { '/opt/unicore/plgrid-idb-templates':
  ensure   => latest,
  provider => svn,
  source   => 'svn://svn.code.sf.net/p/unicore-life/code/plg-utils/plg-idb-templates/trunk/',
  owner    => 'unicore',
  group    => 'unicore',
  require  => [ User['unicore'], Group['unicore'] ]
}
