class apache::mod::gnutls (
  $package_ensure = 'present',
  $package_bin    = "gnutls-bin",
  $package_lib    = "libapache2-mod-gnutls",
  $cachetype      = "none none"  
) {
  
  if !defined(Package["${package_bin}"]) {
    package{"${package_bin}":
      ensure => $package_ensure 
    }
  }  
  
  package{"${package_lib}":
    ensure => $package_ensure
  }
  
  if $package_ensure == present {    
    file {"gnutls.conf":
      ensure  => file,
      path    => "${::apache::mod_dir}/gnutls.conf",
      require => Exec["mkdir ${::apache::mod_dir}"],
      before  => File[$::apache::mod_dir],
      notify  => Class['apache::service'],    
      content => "<IfModule mod_gnutls.c>\n\tGnuTLSCache none none\n</IfModule>\n", 
    }
  } else {
    
  }
}