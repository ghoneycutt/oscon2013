# == Class: ntp
#
# OpenNTP
#
class ntp {

  package { 'ntp_package':
    ensure =>
    name   => 'ntp',
  }

  file { 'ntp_config':
    ensure =>
    path   => '/etc/ntp.conf',
    owner  =>
    group  =>
    mode   =>
  }

  service { 'ntp_service':
    ensure =>
    name   => 'ntpd',
    enable =>
  }
}
