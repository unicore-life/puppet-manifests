
$packageList = [ 'yum', 'git', 'mysql-server', 'mysql' ]

package { 
  $packageList: 
    ensure => installed
}

