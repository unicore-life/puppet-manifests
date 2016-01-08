class plgrid-unicore-core inherits plgrid-site {

  package { ['haproxy', 'htop']: ensure => latest }
}