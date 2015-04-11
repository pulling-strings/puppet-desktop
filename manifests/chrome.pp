# Setting up chrome
class desktop::chrome {

  apt::key { 'google-chrome':
    key        => '7FAC5991',
    key_source => 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
  } ->

  apt::source{'google-chrome':
    location    => 'http://dl.google.com/linux/chrome/deb/',
    release     => 'stable',
    repos       => 'main',
    include_src => false,
    include_deb => true,
  } ->

  package{'google-chrome-stable':
    ensure  => present
  }


}
