# puppet-manifests

Repository contains [Puppet](https://puppetlabs.com) manifests for managing [UNICORE](http://unicore.eu) services.

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
	
Next, it should be just enough to install *puppet* package and puppet module *vcsrepo*
(note, that it may be necessary to install also *yum* system package if missing).
```bash
# yum -y install puppet
# puppet module install puppetlabs-vcsrepo
```

Full *puppet* installation documentation can be found 
[here](http://docs.puppetlabs.com/guides/install_puppet/install_el.html).


## UNICORE Site Configuration

To setup machine for UNICORE Site it should be enough to run below commands.
```bash
# wget --no-check-certificate -O /tmp/init-site.pp https://raw.githubusercontent.com/unicore-life/puppet-manifests/master/manifests/initialization-site.pp
# puppet apply /tmp/init-site.pp 
```

First one downloads initialization manifest and saves it in file `/tmp/init-site.pp`.
Second command applies it into the system.

:bulb: It may be necessary to change RHEL version at the top of initialization script.

## Useful Links

- [Puppet Cookbook](http://www.puppetcookbook.com)
- [Puppet Style Guide](http://docs.puppetlabs.com/guides/style_guide.html)
