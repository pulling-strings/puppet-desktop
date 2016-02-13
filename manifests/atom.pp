# Setting up the atom editor
class desktop::atom {
  apt::ppa { 'ppa:webupd8team/atom': } ->

  package { 'atom':
    ensure => installed,
  }
}
