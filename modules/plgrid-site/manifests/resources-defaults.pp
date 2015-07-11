class plgrid-site::resources-defaults {

# Setup path for all Exec resources:
#
  Exec {
    path => [ '/bin', '/sbin', '/usr/bin', '/usr/sbin' ]
  }
}
