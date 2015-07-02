# Setup path for all exec resources:
#
Exec {
  path => [ '/bin', '/sbin', '/usr/bin', '/usr/sbin' ]
}

# Include directory named with FQDN if it exists level up:
#
$_fqdnDir = "/opt/unicore/puppet-manifests/${fqdn}"
$_fqdnSymLink = "/opt/unicore/puppet-manifests/plgrid-site/${fqdn}"

exec { 'exec.fqdn-symbolic-link':
  command => "sh -c 'if [ -d ${_fqdnDir} ]; then ln -s ${_fqdnDir} ${_fqdnSymLink}; else rm -f ${_fqdnSymLink}; fi'"
}
