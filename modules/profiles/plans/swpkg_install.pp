plan profiles::swpkg_install(
  TargetSpec $nodes,
  String $site_content = 'hello! Update',
) {
  # Install puppet on the target and gather facts
  $nodes.apply_prep

  # Compile the manifest block into a catalog 
  apply($nodes) {
    $user = lookup('profiles::swpkg_install::username')
    $pass = lookup('profiles::swpkg_install::password')
    $url = lookup('profiles::swpkg_install::SPMSurl')
    include chocolatey
    include archive
    $pkgs = [
      #'googlechrome',
      'notepadplusplus',
      'atom',
      'irfanview',
      'miktex',
      'texstudio',
      'vlc',
      'gimp',
      'paint.net',
      'doublecmd',
      'handbrake',
      'vp8-vfw',
      'virtualdub',
      #'microsoft-office-deployment',
    ]
    each($pkgs) |$name | {
      package { $name:
        ensure   => present,
        provider => 'chocolatey',
      }
    }
    # At the time of writing this package google chrome checksums are wrong in Chocolatey, this should be removed
    # package { 'googlechrome':
    # ensure          => '120.0.6099.63',
    # provider        => 'chocolatey',
    # install_options => '--ignore-checksums',
    # }

    # At the time of writing this package Office is in between releases, this is likely not needed in the future
    package { 'microsoft-office-deployment':
      ensure   => '16.0.16731.20398',
      provider => 'chocolatey',
    }

    # Manage Google Chrome settings
    registry_key { 'HKLM\Software\Policies\Google\Chrome\DownloadDirectory':
      ensure => present,
    }
    registry_value { 'HKLM\Software\Policies\Google\Chrome\DownloadDirectory':
      ensure => present,
      type   => string,
      data   => "C:/Users/${user}/Desktop/Editor",
    }

    registry_key { 'HKLM\Software\Policies\Google\Chrome\Recommended\RestoreOnStartupURLs':
      ensure => present,
    }
    registry_value { 'HKLM\Software\Policies\Google\Chrome\Recommended\RestoreOnStartupURLs\1':
      ensure => present,
      type   => string,
      data   => lookup('profiles::swpkg_install::SPMSurl'),
    }

    file { 'C:\Program Files (x86)\Google\Chrome\Application\master_preferences':
      ensure => file,
      source => 'http://jacowfs.jlab.org/swpkg/master_preferences',
    }

    file { 'C:/create_newprofile.ps1':
      ensure => file,
      source => 'puppet:///modules/profiles/create_newprofile.ps1',
      #notify  => Exec['import-module']
    }
    exec { 'import-module':
      command   => "C:/create_newprofile.ps1 ${user} ${pass}",
      unless    => 'if (Get-WmiObject Win32_UserAccount -Filter Name=${user}) \{ exit 1 \}',
      provider  => powershell,
      logoutput => true,
    }

    file { 'C:/Program Files (x86)/Adobe/Acrobat DC/JavaScripts':
      ensure => directory,
    }
    File { 'C:/Program Files (x86)/Adobe/Acrobat DC/Acrobat/JavaScripts/JACoWSetDot.js':
      source => 'http://jacowfs.jlab.org/swpkg/JACoWSetDot.js',
      ensure => file,
    }
    file { 'C:/JACoW/fre3of9x.ttf':
      ensure => file,
      source => 'http://jacowfs.jlab.org/swpkg/fre3of9x.ttf',
    }
    file { 'C:/JACoW/JACoW-12.joboptions':
      ensure => file,
      source => 'https://raw.githubusercontent.com/JACoW-org/AcrobatPitStopTools/master/JACoW-12.joboptions',
    }

    file { "C:/Users/${user}/Desktop/Editor":
      ensure  => directory,
      recurse => true,
      owner   => lookup('profiles::swpkg_install::username'),
    }

    file { 'C:/JACoW/AcrobatDC.reg':
      ensure  => file,
      #recurse => true,
      source  => 'https://jacowfs.jlab.org/swpkg/AcrobatDC.reg',
      #owner   => lookup('profiles::swpkg_install::username'),
    }

    # file { 'c:/Enfocus_PP_19.exe':
    # ensure => file,
    # source => 'http://jacowfs.jlab.org/swpkg/Enfocus_PP_19.exe',
    # notify => Package['pitstop'],
    # }

    archive { 'C:/JACoW/Acrobat_DC_Web_WWMUI.zip':
      ensure         => present,
      extract        => true,
      extract_path   => 'C:/JACoW',
      source         => 'https://trials.adobe.com/AdobeProducts/APRO/Acrobat_HelpX/win32/Acrobat_DC_Web_WWMUI.zip',
      creates        => 'C:/JACoW/Adobe Acrobat',
      cleanup        => false,
      allow_insecure => true,
      notify         => Package['Adobe Acrobat DC'],
    }

    package { 'Adobe Acrobat DC':
      ensure => 'installed',
      source => 'C:/JACoW/Adobe Acrobat/AcroPro.msi',
    }

    file { 'c:/JACoW/setup.iss':
      ensure => file,
      source => 'http://jacowfs.jlab.org/swpkg/setup.iss',
      notify => Package['Enfocus PitStop Pro'],
    }
    file { 'C:/JACoW':
      ensure => directory,
    }
    file { 'c:/JACoW/JACoW-10.joboptions':
      ensure => file,
      source => 'https://jacowfs.jlab.org/swpkg/JACoW-10.joboptions',
      owner  => lookup('profiles::swpkg_install::username'),
    }
    #http://jacowfs.jlab.org/swpkg/Enfocus_PP_19.exe
    package { 'Enfocus PitStop Pro':
      ensure          => installed,
      source          => 'https://cdn.enfocus.com/installers/Enfocus_PitStopPro/2022u1_DWfK0DiRCvUr/Win32/Enfocus_PP_22_update1_32bit.exe',
      require         => File['c:/JACoW/setup.iss'],
      install_options => ['-s','-f1C:\JACoW\setup.iss'],
    }
  }
  #run_task('profiles::add_font', $nodes, path => 'C:/fre3of9x.ttf')
  #run_task('profiles::create_newprofile', $nodes, username => 'anthony', password => 'anthony')
  #run_task('profiles::create_newprofile', $nodes, username => '-Username anthony -password anthony')
}
