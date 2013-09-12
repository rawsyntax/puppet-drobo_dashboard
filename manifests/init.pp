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
    command => '/usr/bin/open /Applications/Install.app',
    require => Package['DroboDashboard'],
    onlyif  => 'test ! /Applications/Drobo\ Dashboard.app'
  }

  exec {'remove the (un)installer':
    command => '/bin/rm -rf /Applications/Install.app /Applications/Uninstall.app',
    require => [
                Package['DroboDashboard'],
                File['/Applications/Install.app'],
                File['/Applications/Uninstall.app'],
                File['/Applications/Drobo\ Dashboard.app']
                ]
  }
}
