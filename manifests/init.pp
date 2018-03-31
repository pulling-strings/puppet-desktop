# setting up a desktop installation
class desktop(
  String $user='',
  String $home='',
  Boolean $cleanup=false,
  Boolean $gif=false
) {

  if $desktop::is_desktop == 'true' {
    if $::operatingsystem == 'Ubuntu' {
      include desktop::misc
      if $gif == true {
        include desktop::gif
      }
      include desktop::xmonad
      include desktop::xfce
      include desktop::chrome
      include desktop::cleanup
      include desktop::harden

    } elsif $::operatingsystem == 'FreeBSD' {
      include desktop::xmonad
      include desktop::chrome
    }
  }
}
