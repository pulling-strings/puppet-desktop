# Misc desktop packages settings
class desktop::misc(
  $scanner = ''
){
  package{['synapse', 'vlc', 'ttyrecord']:
      ensure  => present
  }

  editfile::config { 'disable apport':
    ensure => '0',
    path   => '/etc/default/apport',
    quote  => false,
    sep    => '=',
    entry  => 'enabled',
  }

  if($scanner != ''){
    package{'libsane':
      ensure  => present
    } ->

    file_line { 'saned remote scanner':
      path => '/etc/sane.d/net.conf',
      line => $scanner
    }
  }

  package{['gparted',  'gnome-disk-utility']:
    ensure  => present
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
  }

}
