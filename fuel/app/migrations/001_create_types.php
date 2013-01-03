<?php
namespace Fuel\Migrations;
class Create_types {
	public function up() {
		\DBUtil::create_table('types', array(
			'id' => array('constraint' => 11, 'type' => 'int', 'auto_increment' => true),
			'title' => array('constraint' => 255, 'type' => 'varchar', '0' => true),
		), array('id'));
	}

	public function down() {
		\DBUtil::drop_table('types');
	}
}
?>