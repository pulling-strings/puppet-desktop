# Misc desktop packages settings
class desktop::misc(
  $scanner = ''
){
  package{['vlc', 'sysstat', 'gnome-terminal']:
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

}
