<?php

	define( 'DB_NAME', 			getenv ('WORDPRESS_DB') );
	define( 'DB_USER',			getenv ('WORDPRESS_ADMIN') );
	define( 'DB_PASSWORD',		getenv ('WORDPRESS_ADMIN_PASSWORD') );
	define( 'DB_HOST',			'mariadb:3306' );
	define( 'DB_CHARSET',		'utf8' );
	define( 'DB_COLLATE',		'' );

	define(	'AUTH_KEY',         'HiuCoH2RJ>9Jb+~KXG;CsNS !s&#+S`Ln#3oTGa;TO%C]3bA/{.J9cO=Z%1)a{?^'	);
	define(	'SECURE_AUTH_KEY',  'jhacyslUD4-gFS9h9S+FZbc}sL}9+im,([fw`?kw+{,F~-bnXI?aJIQalGoaZ/;R'	);
	define(	'LOGGED_IN_KEY',    'Fc7E,jzF?=W$|0&5Lg$yVra4L9}=wrl<0`{Qq#qGSmWxLxXifuIQpbh1#X7dhKrx'	);
	define(	'NONCE_KEY',        'bWdf8HPn(*niHieQ2qH/YKl-)v@K*(K+E_b)-SP`doH0TI>n UI4?!2b(L[uCv|T'	);
	define(	'AUTH_SALT',        'u*B-5AF?5?uGY]]st+tpR^D-5T:-. zqLArW[3YyFa =9Q$_b9e[}.pt-**-3x^-'	);
	define(	'SECURE_AUTH_SALT', 'C%h|m~~leHk+7WcDIBrU0!oaof 0PbyAIH:atZE4A}8.*dy!ATKm>,F+:<_2P[z#'	);
	define(	'LOGGED_IN_SALT',   '.@2ata]jv.9Q;$v3?n$Nj_JWGtB5{:W91-%|rEN{|k3i(*$wwn%Wir:|o,N:Q2XU'	);
	define(	'NONCE_SALT',       'hL%{a;[qxnZkPVh5PPS33&FC64I;ua7b@_<Q7T$?a=@?)PoZ]iH{Pf+9/REj=Q63'	);

	$table_prefix = 'wp_';

	define( 'WP_DEBUG', true );
	define( 'WP_DEBUG_LOG', true );
	define( 'WP_DEBUG_DISPLAY', true );

	if ( ! defined( 'ABSPATH' ) ) {
			define( 'ABSPATH', __DIR__ . '/' );
	}

	print_r ($_ENV);
	$env = getenv ();
	echo " \n";
	print_r ($env);


require_once ABSPATH . 'wp-settings.php';
