# Setting up http://flavio.tordini.org/minitube
class desktop::minitube {
  $url  = 'http://flavio.tordini.org/files/minitube/'

  $deb  = 'minitube64.deb'

  exec{'download minitube deb':
    command => "wget -P /usr/src/ ${url}/${deb}",
    user    => 'root',
    path    => ['/usr/bin','/bin'],
    unless  => "test -f /usr/src/${deb}"
  } ->

  package{['libqtgui4', 'libqt4-xml', 'libqt4-network',
            'libqt4-dbus', 'phonon-backend-vlc']:
    ensure  => present
  } ->

  package{['phonon-backend-xine', 'phonon-backend-gstreamer']:
    ensure  => absent
  } ->

  package{'minitube':
    ensure   => latest,
    source   => "/usr/src/${deb}",
    provider => dpkg
  }

}
