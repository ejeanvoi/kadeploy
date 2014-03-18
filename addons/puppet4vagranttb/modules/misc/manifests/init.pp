class misc {
  group {
    'deploy':
      ensure => present,
      gid => 1001;
  }
  user {
    'deploy':
      ensure => present,
      uid => 1000,
      gid => 1001;
  }
  exec {
    'apt-get-update':
      command => "apt-get update",
      path => "/usr/bin";
  }
  package {
    'taktuk':
      ensure => installed;
  }
  package {
    'libtaktuk-perl':
      ensure => installed;
  }
  package {
    'oidentd':
      ensure => installed;
  }
  package {
    'rake':
      ensure => installed;
  }
  package {
    'help2man':
      ensure => installed;
  }
  package {
    'rubygems':
      ensure => installed;
  }
  Group['deploy'] -> User['deploy'] -> Exec['apt-get-update'] -> Package['taktuk'] -> Package['libtaktuk-perl'] -> Package['oidentd'] -> Package['rake'] -> Package['help2man'] -> Package['rubygems']
}