# gif manipulation tools
class desktop::gif {
  package{['ttyrec', 'gifsycle']:
      ensure  => present
  }

  package{'ttygif':
    ensure  => present,
    require => Apt::Source['barbecue']
  }
}
