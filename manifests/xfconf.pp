# this will run only if facter_dbus environment variable is set:
# facter_dbus=$DBUS_SESSION_BUS_ADDRESS sudo -E bash run.sh
define desktop::xfconf(
  $section  ='',
  $property ='',
  $value    = ''
){
  if $::dbus {
    exec{$name:
      command     => "/usr/bin/xfconf-query -c ${section} -p /${section}/${property} -s ${value}",
      user        => $::desktop::user,
      environment => ["HOME=${::desktop::home}", 'DISPLAY=:0',"DBUS_SESSION_BUS_ADDRESS=${::dbus}"],
      path        => ['/usr/bin','/bin','/usr/bin']
    }
  } else {
    notice("skipping ${name} because facter_dbus isn't defined")
  }
}
