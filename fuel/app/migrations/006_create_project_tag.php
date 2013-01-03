<?php
namespace Fuel\Migrations;
class Create_project_tag {
	public function up() {
		\DBUtil::create_table('project_tag', array(
			'id' => array('constraint' => 11, 'type' => 'int', 'auto_increment' => true),
			'project_id' => array('constraint' => 11, 'type' => 'int'),
			'tag_id' => array('constraint' => 11, 'type' => 'int'),
		), array('id'));
	}

	public function down() {
		\DBUtil::drop_table('project_tag');
	}
}
?>