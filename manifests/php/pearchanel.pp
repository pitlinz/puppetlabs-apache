/**
 * add a pear chanel
 */
define apache::php::pearchanel (
  $ensure = present,  
) {
  if $ensure == present {
    exec{"pear_channel-discover_${name}":
      command => "/usr/bin/pear channel-discover ${name}",
      creates => "/usr/share/php/.channels/${name}.reg"      
    }     
  } elsif $ensure == absent {
    file {"/usr/share/php/.channels/${name}.reg":
      ensure => absent
    }
  }
}