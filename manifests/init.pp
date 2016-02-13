# setting up a desktop installation
class desktop($user=false,$home=false) {

  validate_string($user)
  validate_string($home)

  if $desktop::is_desktop == 'true' {
    if $::operatingsystem == 'Ubuntu' {
      include desktop::misc
      include desktop::xmonad
      include desktop::chrome
      include desktop::atom

      package{'gparted':
        ensure  => present
      }
    } elsif $::operatingsystem == 'FreeBSD' {
      include desktop::xmonad
      include desktop::chrome
    }
  }
}
