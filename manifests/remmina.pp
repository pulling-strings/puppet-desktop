# Setting up latest remmina
class desktop::remmina {
  apt::ppa {'ppa:remmina-ppa-team/remmina-next': }

  -> package{['remmina', 'remmina-plugin-spice']:
    ensure  => present
  }
}
