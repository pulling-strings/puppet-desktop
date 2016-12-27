# Setting up chrome
class desktop::chrome {

  if $::operatingsystem == 'Ubuntu' {
    apt::key { 'google-chrome':
      id     => 'EB4C1BFD4F042F6DDDCCEC917721F63BD38B4796',
      source => 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
    } ->

    apt::source{'google-chrome':
      include      => {
        src => false,
        deb => true
      },
      location     => 'http://dl.google.com/linux/chrome/deb/',
      architecture => 'amd64',
      release      => 'stable',
      repos        => 'main',
    } ->

    package{'google-chrome-stable':
      ensure  => present
    }
  } elsif $::operatingsystem == 'FreeBSD' {
    package{'chromium':
      ensure  => present
    }
  }

}
