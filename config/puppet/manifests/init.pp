exec { 'apt-get_update':
    command => 'apt-get update',
    path => '/usr/bin'
}

package { [
    'curl',
    'vim',
    'g++',
    'make'
    ]:
    ensure => installed,
    require => Exec['apt-get_update']
}

class { 'nodejs':
    manage_repo => true,
    require => Exec['apt-get_update']
}

package { [
    'pm2',
    'express'
    ]:
    ensure => present,
    provider => 'npm',
    require => [
        Class['nodejs'],
        Package['make']
    ]
}

exec { 'install_app_dependencies':
    command => 'npm install',
    path => '/usr/bin',
    cwd => '/var/src/app',
    require => Class['nodejs']
}

exec { 'auto_start_app':
    command => 'pm2 start /var/src/app/app.js -i max',
    path => '/usr/bin',
    require => [
        Exec['install_app_dependencies'],
        Package['pm2']
    ]
}