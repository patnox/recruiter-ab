<?php

use yii\db\Migration;

/**
 * Handles the creation of table `profile_experience`.
 */
class m170827_150113_create_profile_experience_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('profile_experience', [
            'id' => $this->primaryKey(),
			'profile_id' => $this->integer()->notNull(),
			'company' => $this->string(128)->notNull(),
			'profession' => $this->string(128)->notNull(),
			'date_from' => $this->datetime()->notNull(),
			'date_to' => $this->datetime()->notNull(),
        ]);
		
		$this->createIndex('profile_experience_index', 'profile_experience', ['profile_id', 'company', 'profession', 'date_from', 'date_to']);
		$this->addForeignKey('fk_profile_experience_profile', 'profile_experience', 'profile_id', 'profile', 'id', 'CASCADE', 'CASCADE');
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
		$this->dropForeignKey('fk_profile_experience_profile', 'profile_experience');
        $this->dropTable('profile_experience');
    }
}
