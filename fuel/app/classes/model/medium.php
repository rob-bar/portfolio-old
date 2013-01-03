<?php
class Model_Medium extends \Orm\Model {
	protected static $_properties = array(
		'id',
		'project_id',
		'asset_id',
		'title',
		'extra_md'
	);
}
?>