# cleaning up un-used packages
class desktop::cleanup {
  package{['kupfer','recordmydesktop']:
    ensure  => absent
  }

  package { 'atom':
    ensure => absent,
  } ->

  apt::ppa { 'ppa:webupd8team/atom':
    ensure => absent
  }
}
