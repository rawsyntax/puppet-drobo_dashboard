# Public: Install DroboDashboard into /Applications.
#
# Examples
#
#   include drobo_dashboard
class drobo_dashboard {
  package { 'DroboDashboard':
    provider => 'appdmg',
    source   => 'http://www.drobo.com/start/download/dashboard/Drobo-Dashboard-installer-2.5.2.dmg',
    ensure => installed
  }

  exec {'run the installer':
    command => '/usr/bin/open /Applications/Install.app'
  }
}
