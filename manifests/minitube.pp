class desktop::minitube {
  $url  = 'http://flavio.tordini.org/files/minitube/'

  $deb  = 'minitube64.deb'

  exec{'download minitube deb':
    command     => "wget -P /usr/src/ ${url}/${deb}",
    environment => ["HOME=${home}"],
    user        => 'root',
    path        => ['/usr/bin','/bin'],
    unless      => "test -f /usr/src/${deb}"
  } ->

  package{'minitube':
    ensure   => latest,
    source   => "/usr/src/${deb}",
    provider => dpkg
  }
 
}
