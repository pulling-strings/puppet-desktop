# setting up a desktop installation
class desktop(
  $user=false,
  $home=false,
  $cleanup=false
) {

  validate_string($user)
  validate_string($home)

  if $desktop::is_desktop == 'true' {
    if $::operatingsystem == 'Ubuntu' {
      include desktop::misc
      include desktop::xmonad
      include desktop::chrome
      include desktop::cleanup

    } elsif $::operatingsystem == 'FreeBSD' {
      include desktop::xmonad
      include desktop::chrome
    }
  }
}
