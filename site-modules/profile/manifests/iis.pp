## Simple base profile
class profile::iis {
  $iis_features = ['Web-WebServer','Web-Scripting-Tools']

  iis_feature { $iis_features:
    ensure => 'present',
  }

  service { 'w3svc':
    ensure  => running,
    enable  => true,
    require => Iis_feature['Web-Webserver'],
  }

  # Delete the default website to prevent a port binding conflict.
  iis_site {'Default Web Site':
    ensure  => absent,
    require => Iis_feature['Web-WebServer'],
  }
}
