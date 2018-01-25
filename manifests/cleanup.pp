# cleaning up un-used packages
class desktop::cleanup(
  $atom = false
){
  package{['kupfer','recordmydesktop']:
    ensure  => absent
  }

  if($atom == true) {
    package { 'atom':
      ensure => absent,
    }

    -> apt::ppa { 'ppa:webupd8team/atom':
      ensure => absent
    }
  }

  if($::desktop::cleanup == true){
      $libreoffice = ['libreoffice-base-core', 'libreoffice-common', 'libreoffice-core',
                      'libreoffice-gtk', 'libreoffice-math', 'libreoffice-style-elementary',
                      'libreoffice-style-galaxy', 'libreoffice-writer', 'libreoffice-calc']

    package{$libreoffice:
      ensure  => absent
    }

    package{['thunderbird','pidgin', 'parole', 'flashplugin-installer']:
      ensure  => absent
    }

    file{["/home/${::user}/Public", "/home/${::user}/Videos"
          , "/home/${::user}/Pictures", "/home/${::user}/Templates", "/home/${::user}/Music"]:
      ensure => absent,
    }
  }


}
