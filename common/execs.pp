Exec { 
    path => [ '/bin', '/sbin', '/usr/bin', '/usr/sbin' ] 
}

#exec { 'exec.fetch-crl':
#  command => '/usr/sbin/fetch-crl -v',
#  require => Package['fetch-crl']
#}

$_fqdnDir = "/opt/unicore/puppet-manifests/${fqdn}"
$_fqdnSymLink = "/opt/unicore/puppet-manifests/common/${fqdn}"

exec { 'exec.fqdn-symbolic-link':
  command => "sh -c 'if [ -d ${_fqdnDir} ]; then ln -s ${_fqdnDir} ${_fqdnSymLink}; else rm -f ${_fqdnSymLink}; fi'"
}


exec { 'exec.install_mysql_puppet_module':
  command => 'puppet module install puppetlabs-mysql',
  require => Package['puppet']
}

