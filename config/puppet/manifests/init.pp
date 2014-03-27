exec { 'apt-get_update':
    command => 'apt-get update',
    path => '/usr/bin'
}

package { [
    'curl',
    'vim',
    'g++',
    'make'
    ]: ensure => installed,
    require => Exec['apt-get_update']
}

class { 'nodejs':
    manage_repo => true,
    require => Exec['apt-get_update']
}

package { 'express':
  ensure => present,
  provider => 'npm',
  require => Class['nodejs']
}

package { 'pm2':
  ensure => present,
  provider => 'npm',
  require => [Package['make'], Class['nodejs']]
}