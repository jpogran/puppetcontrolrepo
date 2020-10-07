## Simple base profile
class profile::users {
  user { 'localdemo1':
    # on Windows can use username, domain\user and SID
    ensure     => present,
    name       => 'Local DemoUser 1',
    managehome => true,
    password   => 'GarbledPasswd!',
    groups     => ['Administrators', 'Users']
  }
}
