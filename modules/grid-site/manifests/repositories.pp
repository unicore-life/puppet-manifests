class grid-site::repositories {
  $rhelVersion = '6'
  $epelVersion = '6-8'

  package { 'epel-release':
    provider        => rpm,
    ensure          => installed,
    install_options => ['--nodeps'],
    source          => "http://download.fedoraproject.org/pub/epel/${rhelVersion}/x86_64/epel-release-${epelVersion}.noarch.rpm"
  }

  yumrepo { 'eugridpma':
    baseurl  => 'http://dist.eugridpma.info/distribution/igtf/current/',
    descr    => 'EUGridPMA',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'https://dist.eugridpma.info/distribution/igtf/current/GPG-KEY-EUGridPMA-RPM-3',
    name     => 'eugridpma'
  }
}