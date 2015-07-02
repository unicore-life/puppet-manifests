# puppet-manifests


## Installation of Puppet

Latest versions of Puppet can be installed using Puppet Labs package repository on your RHEL/CentOS version. 
It is necessary to install *puppetlabs-release* package first.

- RHEL/CentOS 7
	```bash
	# rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
	```

- RHEL/CentOS 6
	```bash
	# rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
	```

- RHEL/CentOS 5
	```bash
	# rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-5.noarch.rpm
	```
	
Next, it should be just enough to install *puppet* package 
(note, that it may be necessary to install also *yum* system package if missing).
```bash
# yum install puppet
```

Full *puppet* installation documentation can be found 
[here](http://docs.puppetlabs.com/guides/install_puppet/install_el.html).


## UNICORE Site System Configuration Setup

To setup machine for UNICORE Site it should be enough to run below commands.
```bash
# wget -O /tmp/init-site.pp https://raw.githubusercontent.com/unicore-life/puppet-manifests/master/initialization-site.pp
# puppet apply /tmp/init-site.pp 
```

First one downloads initialization manifest and saves it in file `/tmp/init-site.pp`.
Second command applies it in the system.

:bulb: It may be necessary to change RHEL version at the top of initialization script.
