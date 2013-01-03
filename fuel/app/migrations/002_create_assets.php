<?php
namespace Fuel\Migrations;
class Create_assets {
	public function up() {
		\DBUtil::create_table('assets', array(
			'id' => array('constraint' => 11, 'type' => 'int', 'auto_increment' => true),
			'type_id' => array('constraint' => 11, 'type' => 'int'),
			'extension' => array('constraint' => 255, 'type' => 'varchar', '0' => true),
			'alt_loc' => array('constraint' => 255, 'type' => 'varchar', '0' => true),
		), array('id'));
	}

	public function down() {
		\DBUtil::drop_table('assets');
	}
}
?>