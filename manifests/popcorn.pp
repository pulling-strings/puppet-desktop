# Setting up https://popcorntime.io/
class desktop::popcorn {
  apt::ppa {'ppa:webupd8team/popcorntime': } 
  
  # ->
  #
  # package{'popcorn-time':
  #   ensure  => present
  # }
}
