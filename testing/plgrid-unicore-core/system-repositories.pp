$rhelVersion = '6'
$epelVersion = '6-8'

package { 'epel-release':
  provider        => rpm,
  ensure          => installed,
  install_options => ['--nodeps'],
  source          => "http://download.fedoraproject.org/pub/epel/${rhelVersion}/x86_64/epel-release-${epelVersion}.noarch.rpm"
}

package { 'plgrid-repos':
  provider        => rpm,
  ensure          => installed,
  install_options => ['--nodeps'],
  source          => 'http://software.plgrid.pl/packages/repos/plgrid-repos-2010-2.noarch.rpm'
}


yumrepo { 'eugridpma':
  baseurl  => 'http://dist.eugridpma.info/distribution/igtf/current/',
  descr    => 'EUGridPMA',
  enabled  => 1,
  gpgcheck => 1,
  gpgkey   => 'https://dist.eugridpma.info/distribution/igtf/current/GPG-KEY-EUGridPMA-RPM-3',
  name     => 'eugridpma'
}
