# Setting up xmonad
class desktop::xmonad {
  $xmonad = "${desktop::home}/.xmonad"

  git::clone {$xmonad:
    url   => 'git://github.com/narkisr/xmonad-config.git',
    dst   => $xmonad,
    owner => $desktop::user
  }

  if $::osfamily == 'Debian' {
    package{['xmonad','ghc','libghc-xmonad-contrib-dev','xubuntu-desktop']:
      ensure  => present
    } -> Exec['xmonad --recompile']

  } elsif $::osfamily == 'FreeBSD' {
    package{['hs-xmonad-0.11.1', 'hs-xmonad-contrib-0.11.4']:
      ensure  => present
    } -> Exec['xmonad --recompile']

  }

  exec{'xmonad --recompile':
    user        => $desktop::user,
    path        => ['/usr/bin','/bin','/usr/local/bin/'],
    creates     => "${xmonad}/xmonad.o",
    environment => "HOME=${desktop::home}",
    require     => Git::Clone[$xmonad]
  }
}
