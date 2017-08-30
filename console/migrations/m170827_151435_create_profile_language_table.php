<?php

use yii\db\Migration;

/**
 * Handles the creation of table `profile_language`.
 */
class m170827_151435_create_profile_language_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('profile_language', [
            'id' => $this->primaryKey(),
			'profile_id' => $this->integer()->notNull(),
			'language_name' => $this->string(128)->notNull()
        ]);
		
		$this->createIndex('profile_language_index', 'profile_language', ['profile_id', 'language_name']);
		$this->addForeignKey('fk_profile_language_profile', 'profile_language', 'profile_id', 'profile', 'id', 'CASCADE', 'CASCADE');
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
		$this->dropForeignKey('fk_profile_language_profile', 'profile_language');
        $this->dropTable('profile_language');
    }
}
