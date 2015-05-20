class apache::php::phpmyadmin (

) {
    if !defined(Package["php5-mysql"]) {
        package{"php5-mysql":
            ensure => installed
		}
    }

	package{"phpmyadmin":
		ensure => installed
	}
}
