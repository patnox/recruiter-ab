<?php

use yii\db\Migration;

/**
 * Handles the creation of table `profile_education`.
 */
class m170827_150050_create_profile_education_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('profile_education', [
            'id' => $this->primaryKey(),
			'profile_id' => $this->integer()->notNull(),
			'institution' => $this->string(128)->notNull(),
			'course' => $this->string(128)->notNull(),
			'date_from' => $this->datetime()->notNull(),
			'date_to' => $this->datetime()->notNull(),
        ]);
		
		$this->createIndex('profile_education_index', 'profile_education', ['profile_id', 'institution', 'course', 'date_from', 'date_to']);
		$this->addForeignKey('fk_profile_education_profile', 'profile_education', 'profile_id', 'profile', 'id', 'CASCADE', 'CASCADE');
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
		$this->dropForeignKey('fk_profile_education_profile', 'profile_education');
        $this->dropTable('profile_education');
    }
}
