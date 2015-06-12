Exec { 
    path => [ '/bin', '/sbin', '/usr/bin', '/usr/sbin' ] 
}

#exec { 'exec.fetch-crl':
#  command => '/usr/sbin/fetch-crl -v',
#  require => Package['fetch-crl']
#}

$_fqdnDirectory = "/opt/unicore/puppet-manifests/${fqdn}"
$_fqdnSymbolicLink = "/opt/unicore/puppet-manifests/common/${fqdn}"

exec { 'exec.fqdn-symbolic-link':
  command => "sh -c 'if [ -d ${_fqdnDirectory} ]; then ln -s ${_fqdnDirectory} ${_fqdnSymbolicLink}; else rm -f ${_fqdnSymbolicLink}; fi'"
}

