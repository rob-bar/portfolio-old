<?php
class Model_Project extends \Orm\Model {
	protected static $_properties = array(
		'id',
		'title',
		'description_md',
		'launched',
		'is_important'
	);

	protected static $_observers = array(
		'Orm\Observer_CreatedAt' => array(
			'events' => array('before_insert'),
			'mysql_timestamp' => true,
		),
		'Orm\Observer_UpdatedAt' => array(
			'events' => array('before_save'),
			'mysql_timestamp' => true,
		),
	);
}
?>