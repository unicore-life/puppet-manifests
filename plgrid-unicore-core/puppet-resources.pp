# Setup path for all Exec resources:
#
Exec {
  path => [ '/bin', '/sbin', '/usr/bin', '/usr/sbin' ]
}


# Setup path for all File resources:
#
File {
  ensure  => 'present',
  owner   => 'root',
  group   => 'unicore',
  mode    => 640,
  require => Group['unicore']
}


# Setting additional run stages:
#
stage { 'overture':
  before => Stage['main']
}

stage { 'finale': }

Stage['main'] -> Stage['finale']
