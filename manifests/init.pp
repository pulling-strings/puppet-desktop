# setting up a desktop installation
class desktop($user=false,$home=false) {

  validate_string($user)
  validate_string($home)

  if($desktop::is_desktop == 'true'){
    include desktop::misc
    include desktop::xmonad
    include desktop::chrome

    package{'gparted':
      ensure  => present
    }
  }
}
