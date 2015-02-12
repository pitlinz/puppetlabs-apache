/*
 * install php-pear 
 */
class apache::php::pear(
  
) {
  if !defined(Package["php5"]) {
	  package{"php5":
	    ensure => installed
	  }  
  }
  
  if !defined(Class["apache::mod::php"]) {
    class{"apache::mod::php":
      require => Package["php5"]
    }
  }
    
  if !defined(Package["php-pear"]) {
    package{"php-pear":
      ensure => installed,
      require => Package["php5"]
    }
  }  
}
