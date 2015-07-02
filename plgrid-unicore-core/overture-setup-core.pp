$_manifestsDir = '/opt/unicore/puppet-manifests'


# Include plgrid-unicore-core module in module named ${_plgModule}:
#
exec { 'exec.core-manifests-symbolic-link':
  command => "ln -s ${_manifestsDir}/plgrid-unicore-core ${_manifestsDir}/${_plgModule}/core",
  stage   => 'overture'
}


# Include directory named with FQDN if it exists level up:
#
$_fqdnDir = "${_manifestsDir}/${fqdn}"
$_fqdnSymLink = "${_manifestsDir}/${_plgModule}/${fqdn}"

exec { 'exec.fqdn-symbolic-link':
  command => "sh -c 'if [ -d ${_fqdnDir} ]; then ln -s ${_fqdnDir} ${_fqdnSymLink}; else rm -f ${_fqdnSymLink}; fi'",
  stage   => 'overture'
}
