# dosbox
# ======
# Configure dosbox
#
# Parameters
# ==========
# [*ensure*]
#   state that dosbox should be in (doesn't remove virtual drive)
# [*package*]
#   dosbox package to install
# [*virtual_drive*]
#   path to virtual 'C' drive
# [*user*]
#   user who owns the virtual drive (root)
# [*group*]
#   group who owns the virtual drives.  Add your dosbox users to this group to
#   allow them write access
# [*mode*]
#   directory mode for the dos virtual drive
# [*fullscreen*]
#   start in fullscreen mode
# [*fullresolution*]
#   resolution to use in fullscreen mode
# [*windowresolution*]
#   resolution to use in windowed mode
# [*output*]
#   video output technology
# [*scaler*]
#   how to scale video output
# [*aspect*]
#   preserve aspect ratio
class dosbox(
    $ensure           = present,
    $package          = $dosbox::params::package,
    $virtual_drive    = $dosbox::params::virtual_drive,
    $user             = $dosbox::params::user,
    $group            = $dosbox::params::group,
    $mode             = $dosbox::params::mode,
    $fullscreen       = $dosbox::params::fullscreen,
    $fullresolution   = $dosbox::params::fullresolution,
    $windowresolution = $dosbox::params::windowresolution,
    $output           = $dosbox::params::output,
    $scaler           = $dosbox::params::scaler,
    $aspect           = $dosbox::params::aspect,
) inherits dosbox::params {

  package { $package:
    ensure => $ensure,
  }

  group { $group:
    ensure => $ensure,
  }

  # do not allow changing ensure to delete the virtual drive
  if $ensure == present {
    file { $virtual_drive:
      ensure => present,
      owner  => $owner,
      group  => $group,
      mode   => $mode,
    }
  }

  file { "/etc/dosbox.conf":
    ensure  => $ensure,
    owner   => "root",
    group   => "root",
    mode    => "0644",
    content => template("${module_name}/dosbox.conf.erb"),
  }

  # Install a wrapper script to ensure our config file gets used.  This works
  # because /usr/local/bin is higher up the $PATH variable then /usr/bin.  If
  # it doesn't work, ensure your $PATH is correct
  file { "/usr/local/bin/dosbox":
    ensure => $ensure,
    owner  => "root",
    group  => "root",
    mode   => "0755",
    source => "puppet:///modules/${module_name}/dosbox",
  }
}
