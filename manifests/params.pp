class dosbox::params {
  # name of the dosbox package
  $package          = "dosbox"

  # location of the files to map to virtal drive 'c'
  $virtual_drive    = "/srv/files/dos"

  # owner for files in the virtual drive
  $owner            = "root"

  # group owner for files in the virtual drive
  $group            = "dosbox"

  # mode for the files in the virtual drive - group writable + sticky
  $mode             = "3664"

  # default settings for dosbox mapping to config file directives of the same 
  # names
  $fullscreen       = false
  $fullresolution   = "original"
  $windowresolution = "original"
  $output           = "surface"
  $scaler           = "normal2x"
  $aspect           = false
}
