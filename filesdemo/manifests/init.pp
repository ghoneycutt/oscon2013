# == Class: filesdemo
#
# Demonstrate how to use the file resource.
#
class filesdemo {

  file { '/tmp/dir':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/tmp/dir/file':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { '/tmp/dir/symlink':
    ensure => link,
    target => '/tmp/dir/file',
  }
}
