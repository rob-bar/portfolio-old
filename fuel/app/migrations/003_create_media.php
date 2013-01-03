<?php
namespace Fuel\Migrations;
class Create_media {
	public function up() {
		\DBUtil::create_table('medias', array(
			'id' => array('constraint' => 11, 'type' => 'int', 'auto_increment' => true),
			'project_id' => array('constraint' => 11, 'type' => 'int'),
			'asset_id' => array('constraint' => 11, 'type' => 'int'),
			'title' => array('constraint' => 255, 'type' => 'varchar', '0' => true),
			'extra_md' => array('type' => 'text'),
		), array('id'));
	}

	public function down() {
		\DBUtil::drop_table('medias');
	}
}
?>