/**
 * add a pear chanel
 */
define apache::php::pearpackage (
  $creates  = undef, 
) {
  exec{"pear_install_package_${name}":
    command => "/usr/bin/pear install ${name}",
    creates => "/usr/share/php/${creates}"
  }
}