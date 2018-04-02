# Hardening desktop
class desktop::harden {
  exec{'disable bluetooth':
    command => 'systemctl disable bluetooth.service',
    user    => 'root',
    path    => ['/bin'],
    onlyif  => '/usr/bin/test -f /etc/init.d/bluetooth'
  }
}
