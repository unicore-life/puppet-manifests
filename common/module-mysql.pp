class { '::mysql::server': }

mysql::db { 'plg_unicorex_db':
  user     => 'unicore',
  password => 'change!it',
  host     => 'localhost',
  grant    => ['SELECT', 'INSERT', 'UPDATE', 'DELETE', 'CREATE'],
  require  => [ Package['mysql-server'], Service['mysqld'], Exec['exec.install_mysql_puppet_module'] ]
}

