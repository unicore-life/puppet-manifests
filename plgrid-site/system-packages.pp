$installedPackagesList = ['bash', 'expect', 'git', 'perl', 'puppet', 'python', 'subversion']
$latestPackagesList = ['java-1.7.0-openjdk', 'java-1.8.0-openjdk']

package { $installedPackagesList:
  ensure => installed
}

package { $latestPackagesList:
  ensure => latest
}

# Set default Java system version:
#
exec { 'exec.set_java_alternatives':
  command => '/usr/sbin/alternatives --set java /usr/lib/jvm/jre-1.7.0-openjdk/bin/java',
  require => [ Package['java-1.7.0-openjdk'], Package['java-1.8.0-openjdk'] ]
}
