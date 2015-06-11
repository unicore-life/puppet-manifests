# puppet-manifests


## Installation of puppet

You can install latest versions of Puppet using Puppet Labs package repository on your correspondent RHEL/CentOS versions. It may be necessary to install 'yum'.

### RHEL/CentOS 7

	# rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

### RHEL/CentOS 6

	# rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm

### RHEL/CentOS 5

	# rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-5.noarch.rpm

Finally you should be able just to run:

	# wget -O /tmp/init.pp https://raw.githubusercontent.com/unicore-life/puppet-manifests/master/initialization.pp
	# puppet apply /tmp/init.pp 


