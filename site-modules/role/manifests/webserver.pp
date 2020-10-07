## Simple web server role
class role::webserver {
  include profile::base
  include profile::iis
  include profile::users

  iis_site { 'minimal':
    ensure => 'started',
    physicalpath => 'c:\\inetpub\\minimal',
    applicationpool => 'DefaultAppPool',
    require => [
      File['minimal'],
      Iis_site['Default Web Site']
    ],
  }

  file { 'minimal':
    ensure => 'directory'
    path   => 'c:\\inetpub\\minimal'
  }
}
