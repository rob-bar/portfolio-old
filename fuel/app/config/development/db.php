<?php
/**
 * The development database settings.
 */

return array(
	'default' => array(
		'type'        => 'mysqli',
		'connection'     => array(
			'hostname'       => '127.0.0.1',
			'port'           => '3306',
			'database'       => 'portfolio',
			'username'       => 'robbieb',
			'password'       => 'DeV_4321',
			'persistent'     => false,
			'compress'			=> true
		),
		'identifier'   => '`',
		'table_prefix' => '',
		'charset'      => 'utf8',
		'enable_cache' => true,
		'profiling'    => true,
	),
);
?>