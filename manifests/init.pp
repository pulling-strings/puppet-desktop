# setting up a desktop installation
class desktop(
  $user=false,
  $home=false,
  $cleanup=false,
  $gif=false
) {

  validate_string($user)
  validate_string($home)

  if $desktop::is_desktop == 'true' {
    if $::operatingsystem == 'Ubuntu' {
      include desktop::misc
      if $::gif == true {
        include desktop::gif
      }
      include desktop::xmonad
      include desktop::xfce
      include desktop::chrome
      include desktop::cleanup

    } elsif $::operatingsystem == 'FreeBSD' {
      include desktop::xmonad
      include desktop::chrome
    }
  }
}
