<?php
namespace Fuel\Migrations;
class Create_projects {
	public function up() {
		\DBUtil::create_table('projects', array(
			'id' => array('constraint' => 11, 'type' => 'int', 'auto_increment' => true),
			'title' => array('constraint' => 255, 'type' => 'varchar', '0' => true),
			'description_md' => array('type' => 'text'),
			'launched' => array('type' => 'date'),
			'is_important' => array('constraint' => 11, 'type' => 'int'),
			'created_at' => array('type' => 'timestamp'),
			'updated_at' => array('type' => 'timestamp'),
		), array('id'));
	}

	public function down() {
		\DBUtil::drop_table('projects');
	}
}
?>