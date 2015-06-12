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


exec { 'exec.install_mysql_puppet_module':
  command => 'puppet module install puppetlabs-mysql',
  require => Package['puppet']
}

exec { 'exec.set_java_alternatives':
  command => '/usr/sbin/alternatives --set java /usr/lib/jvm/jre-1.7.0-openjdk/bin/java',
  require => [ Package['java-1.7.0-openjdk'], Package['java-1.8.0-openjdk'] ]
}

