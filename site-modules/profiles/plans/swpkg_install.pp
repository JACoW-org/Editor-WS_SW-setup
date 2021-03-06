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
    $pkgs = [
      '7zip',
      'googlechrome',
      'notepadplusplus',
      'atom',
      'irfanview',
      'miktex',
      'texstudio',
      'vlc',
      #'gimp',
      'paint.net',
      'doublecmd',
      'handbrake',
      'vp8-vfw',
      'virtualdub',
    ]
    each($pkgs) |$name | {
    package { $name:
      ensure   => present,
      provider => 'chocolatey'
      }
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

/*  COmmented out 2020-06-10
    file { 'C:\Program Files (x86)\Google\Chrome\Application\master_preferences':
    ensure => file,
    source => 'https://jacowfs.jlab.org/swpkg/master_preferences',
    }

    file { 'C:/create_newprofile.ps1':
      ensure => file,
      source => 'puppet:///modules/profiles/create_newprofile.ps1',
      #notify  => Exec['import-module']
    } */
    exec { 'import-module':
      command   => "C:/create_newprofile.ps1 ${user} ${pass}",
      unless    => "if (Get-WmiObject Win32_UserAccount -Filter Name=${user}) \{ exit 1 \}",
      provider  => powershell,
      logoutput => true,
    }

    # 
    # file { 'C:/Program Files (x86)/Adobe/Acrobat DC/JavaScripts':
    # ensure => directory
    # }
    # 
/*  Commented out 2020-06-10
    File { 'C:/Program Files (x86)/Adobe/Acrobat DC/Acrobat/JavaScripts/JACoWSetDot.js':
      source => 'https://jacowfs.jlab.org/swpkg/JACoWSetDot.js',
      ensure => file
    }
    file { 'C:/fre3of9x.ttf':
      ensure => file,
      source => 'https://jacowfs.jlab.org/swpkg/fre3of9x.ttf',
    }

    file {"C:/Users/${user}/Desktop/Editor":
      ensure  => directory,
      recurse => true,
      owner   => lookup('profiles::swpkg_install::username'),
    }

    file {"C:/Users/${user}/Desktop/AcrobatDC.reg":
      ensure  => directory,
      recurse => true,
      source  => 'https://jacowfs.jlab.org/swpkg/AcrobatDC.reg',
      owner   => lookup('profiles::swpkg_install::username'),
    } */

    # file { 'c:/Enfocus_PP_19.exe':
    # ensure => present,
    # source => 'https://jacowfs.jlab.org/swpkg/Enfocus_PP_19.exe',
    # notify => Package['pitstop'],
    # }

    download_file { 'Download setup.iss' :
      url                   => 'https://jacowfs.jlab.org/swpkg/setup.iss',
      destination_directory => 'c:\temp',
      notify                => Package['Enfocus PitStop Pro'],
    }
    download_file { 'Download Enfocus' :
      url                   => 'https://jacowfs.jlab.org/swpkg/Enfocus_PP_19.exe',
      destination_directory => 'c:\temp',
      #notify                => Package['Enfocus PitStop Pro'],
    }
    /* Commented out 2020-06-10
    file { 'c:/setup.iss':
      ensure => present,
      source => 'https://jacowfs.jlab.org/swpkg/setup.iss',
      notify => Package['Enfocus PitStop Pro'],
    } */
    package { 'Enfocus PitStop Pro':
      ensure          => installed,
      source          => 'c:\temp\Enfocus_PP_19.exe',
      require         => Download_file['Download Enfocus'],
      install_options => ['-s','-f1C:\temp\setup.iss'],
      }
    }
  #run_task('profiles::add_font', $nodes, path => 'C:/fre3of9x.ttf')
  #run_task('profiles::create_newprofile', $nodes, username => 'user', password => 'pass')
  #run_task('profiles::create_newprofile', $nodes, username => '-Username user -password pass')
}
