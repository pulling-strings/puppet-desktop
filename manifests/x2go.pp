# Setting up http://wiki.x2go.org/doku.php/wiki:repositories:ubuntu
class desktop::x2go($server=false, $lan='0.0.0.0') {

  ensure_resource('class', 'apt', {})
  ensure_resource('class', 'ufw', {})

  apt::ppa {'ppa:x2go/stable': }

  if($server == true){
    package{['x2goserver', 'x2goserver-xsession']:
      ensure  => present,
      require => Apt::Ppa['ppa:x2go/stable']
    }
    ufw::allow { 'ssh port':
      port => '22',
      from => $lan,
    }
  } else {
    package{'x2goclient':
      ensure  => present
    }
  }
}
