class plgrid-unicore-site inherits plgrid-unicore-core {

  package { ['unicore-gateway', 'unicore-unicorex', 'unicore-uftpd']:
    ensure  => installed,
    require => Package['plgrid-repos']
  }

  service { 'unicore-gateway':
    enable  => true,
    require => Package['unicore-gateway']
  }

  service { 'unicore-unicorex':
    enable  => true,
    require => Package['unicore-unicorex']
  }

  service { 'unicore-uftpd':
    enable  => false,
    require => Package['unicore-uftpd']
  }

  vcsrepo { '/opt/unicore/plgrid-idb-templates':
    ensure   => latest,
    provider => svn,
    source   => 'svn://svn.code.sf.net/p/unicore-life/code/plg-utils/plg-idb-templates/trunk/',
    owner    => 'unicore',
    group    => 'unicore',
    require  => [ User['unicore'], Group['unicore'] ]
  }
}
