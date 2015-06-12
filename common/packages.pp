$installedPackagesList = ['bash', 'expect', 'git', 'perl', 'puppet', 'python', 'subversion']
$latestPackagesList = ['java-1.7.0-openjdk', 'java-1.8.0-openjdk']

package { $installedPackagesList: ensure => installed }
package { $latestPackagesList: ensure => latest }

package { 'ca_policy_eugridpma':
  ensure  => latest,
  require => Yumrepo['eugridpma']
}

package { 'fetch-crl':
  ensure  => latest,
  require => Package['epel-release']
}

package { 'ca_PLGRID-SimpleCA':
  ensure  => latest,
  require => Package['plgrid-repos']
}

