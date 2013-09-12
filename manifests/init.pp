# Public: Install DroboDashboard into /Applications.
#
# Examples
#
#   include drobo_dashboard
class drobo_dashboard {
  package { 'DroboDashboard':
    ensure   => installed,
    provider => 'appdmg',
    source   => 'http://www.drobo.com/start/download/dashboard/Drobo-Dashboard-installer-2.5.2.dmg'
  }

  exec {'run the installer':
    command   => '/usr/bin/open /Applications/Install.app',
    require   => Package['DroboDashboard']
  }
}
