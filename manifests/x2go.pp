# Setting up http://wiki.x2go.org/doku.php/wiki:repositories:ubuntu
class desktop::x2go($server=false) {
  apt::ppa {'ppa:x2go/stable': }

  if($server == true){
    package{['x2goserver', 'x2goserver-xsession']:
      ensure  => present,
      require => Apt::Ppa['ppa:x2go/stable']
    }
  }
}
