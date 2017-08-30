<?php

use yii\db\Migration;

/**
 * Handles the creation of table `profile`.
 */
class m170827_150023_create_profile_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('profile', [
            'id' => $this->primaryKey(),
			'user_id' => $this->integer()->notNull(),
			'country_id' => $this->integer()->notNull(),
			'dob' => $this->datetime()->notNull(),
			'expected_salary' => $this->integer()->notNull(),
			'description' => $this->text()->notNull(),
			'first_name' => $this->string(128)->notNull(),
			'last_name' => $this->string(128)->notNull(),
			'address' => $this->string(128)->notNull(),
        ]);
		
		$this->createIndex('profile_index', 'profile', ['user_id', 'country_id', 'dob', 'expected_salary']);
		$this->addForeignKey('fk_profile_user', 'profile', 'user_id', 'user', 'id', 'CASCADE', 'CASCADE');
		$this->addForeignKey('fk_profile_country', 'profile', 'country_id', 'countries', 'id', 'CASCADE', 'CASCADE');
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
		$this->dropForeignKey('fk_profile_user', 'profile');
		$this->dropForeignKey('fk_profile_country', 'profile');
        $this->dropTable('profile');
    }
}
