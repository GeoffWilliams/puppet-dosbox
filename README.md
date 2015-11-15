# dosbox
[![Build Status](https://travis-ci.org/GeoffWilliams/puppet-dosbox.svg)](https://travis-ci.org/GeoffWilliams/puppet-dosbox)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with dosbox](#setup)
    * [What dosbox affects](#what-dosbox-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with dosbox](#beginning-with-dosbox)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Install and configure dosbox

## Module Description

Manages the [dosbox](http://www.dosbox.com/) package, adds a global configuration file and a wrapper script to invoke it.  Also manages a directory to use as a virtual disk drive so that dosbox is ready to use right away.

## Setup

### What dosbox affects

* dosbox package
* global config file
* script at `/usr/local/bin` to wrap dosbox and use above config file (used due to higher path priority)
* some settings in config file are managed
* creates directory at `/srv/files/dos` to use as virtual drive `c:` with sticky group set
* creates `dosbox` group to grant access to files in `c:` (add users to it externally)


### Beginning with dosbox

```puppet
include dosbox
```

Install dosbox with the default settings.  The class is parameterised to allow customisation.  See source code for details.

## Usage
```puppet
class { "dosbox":
  fullscreen => true,
  scaler     => "advinterp3x",
  output     => "opengl",
  aspect     => true,
}
```
Override the config file defaults to give a nicer scaler and use OpenGL

## Reference
* `dosbox` - configure dosbox
* `dosbox::params` - externalised variables (params pattern)

## Limitations

Tested on Ubuntu but will probably work elsewhere.

## Development

PRs accepted
