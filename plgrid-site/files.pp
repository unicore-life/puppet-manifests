# Setup path for all File resources:
#
File {
  ensure  => 'present',
  owner   => 'root',
  group   => 'unicore',
  mode    => 640,
  require => Group['unicore']
}
