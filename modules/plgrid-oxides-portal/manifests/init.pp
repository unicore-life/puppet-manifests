class plgrid-oxides-protal inherits plgrid-site {
  package { ['haproxy', 'unzip', 'vim', 'screen', 'htop']: ensure => latest }

  service { 'haproxy':
    ensure  => running,
    enable  => true,
    require => Package['haproxy']
  }

  #  Configuration of haproxy (redirect http to https):
  #
  #     frontend  main *:80
  #       redirect scheme https code 301 if !{ ssl_fc }
}