# Hardening desktop
class desktop::harden {
  service{'bluetooth':
    ensure    => stopped,
    enable    => true,
    hasstatus => true,
  }
}
