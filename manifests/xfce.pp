# Setting up xfce
class desktop::xfce(
  $blank_timeout = 1
){
  $dest = '.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml'

  file{"${::desktop::home}/${dest}":
    ensure => file,
    mode   => '0644',
    source => 'puppet:///modules/desktop/xfce4-keyboard-shortcuts.xml',
    owner  => root,
    group  => root,
  }

  desktop::xfconf {'blank on battery':
    section  => 'xfce4-power-manager',
    property => 'blank-on-battery',
    value    => $blank_timeout
  }

  desktop::xfconf {'blank on ac':
    section  => 'xfce4-power-manager',
    property => 'blank-on-ac',
    value    => $blank_timeout
  }
}
