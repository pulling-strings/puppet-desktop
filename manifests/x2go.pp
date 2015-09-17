# Setting up http://wiki.x2go.org/doku.php/wiki:repositories:ubuntu
class desktop::x2go(
  $server=false,
  $lan='0.0.0.0',
  $port = '22'
) {

  apt::ppa {'ppa:x2go/stable':
    package_manage => true
  }

  if($server == true){
    Class['apt::update'] ->
    package{['x2goserver', 'x2goserver-xsession']:
      ensure  => present,
      require => Apt::Ppa['ppa:x2go/stable']
    }

    ensure_resource('class', 'ufw', {})
    ensure_resource('ufw::allow','ssh port', {port => $port, from => $lan})

  } else {
    package{'x2goclient':
      ensure  => present
    }
  }
}
