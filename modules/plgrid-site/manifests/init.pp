class plgrid-unicore-core inherits grid-site {
  contain plgrid-site::resources-defaults

  package { ['git', 'subversion']: ensure => installed }

  package { 'plgrid-repos':
    provider        => rpm,
    ensure          => installed,
    install_options => ['--nodeps'],
    source          => 'http://software.plgrid.pl/packages/repos/plgrid-repos-2010-2.noarch.rpm'
  }

  package { 'ca_PLGRID-SimpleCA':
    ensure  => latest,
    require => Package['plgrid-repos']
  }

  contain plgrid-site::resources-puppet
}