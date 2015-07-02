$unicoreId = '490'

user { 'unicore':
  ensure     => 'present',
  uid        => "${unicoreId}",
  gid        => "${unicoreId}",
  shell      => '/bin/bash',
  comment    => 'UNICORE',
  home       => '/usr/share/unicore',
  managehome => true,
  forcelocal => true,
  require    => Group['unicore']
}

group { 'unicore':
  ensure  => 'present',
  gid     => "${unicoreId}"
}

file { '/usr/share/unicore':
  ensure  => directory,
  owner   => 'unicore',
  group   => 'unicore',
  mode    => 0755,
  require => [ User['unicore'], Group['unicore'] ]
}

