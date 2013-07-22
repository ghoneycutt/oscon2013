# == Class: motd
#
# Message of the Day
#
class motd {

  file { '/etc/motd':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

#  type { 'title':
#    attribute => value,
#  }
}
