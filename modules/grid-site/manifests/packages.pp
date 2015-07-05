class grid-site::packages {
  $installedPackagesList = ['bash', 'expect', 'perl', 'puppet', 'python']
  $latestPackagesList = ['java-1.7.0-openjdk', 'java-1.8.0-openjdk']

  package { $installedPackagesList:
    ensure => installed
  }

  package { $latestPackagesList:
    ensure => latest
  }

# Set default Java system version:
#
#exec { 'exec.set_java_alternatives':
#  command => '/usr/sbin/alternatives --set java /etc/alternatives/jre_1.7.0/bin/java',
#  require => [ Package['java-1.7.0-openjdk'], Package['java-1.8.0-openjdk'] ]
#}
}
