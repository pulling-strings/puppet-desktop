# Setting up xfce
class desktop::xfce {
  $dest = '.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml'

  file{"${::desktop::home}/${dest}":
    ensure => file,
    mode   => '0644',
    source => 'puppet:///modules/desktop/xfce4-keyboard-shortcuts.xml',
    owner  => root,
    group  => root,
  }
}
