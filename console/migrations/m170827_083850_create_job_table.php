<?php

use yii\db\Migration;

/**
 * Handles the creation of table `job`.
 */
class m170827_083850_create_job_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('job', [
            'id' => $this->primaryKey(),
			'title' => $this->string(128)->notNull(),
            'slug' => $this->string(128)->notNull(),
			'company' => $this->string(128)->notNull(),
			'salary' => $this->string(128)->notNull(),
			'location' => $this->string(128)->notNull(),
            'content' => $this->text()->notNull(),
            'created_at' => $this->datetime()->notNull(),
            'updated_at' => $this->datetime(),
			'expires_at' => $this->datetime(),
            'created_by' => $this->integer()->notNull(),
            'updated_by' => $this->integer(),
            'category_id' => $this->integer()->notNull(),
			'disabled' => $this->integer()->notNull()->defaultValue(0),
        ]);
		
		$this->createIndex('job_index', 'job', ['created_by', 'updated_by']);
        $this->addForeignKey('fk_job_category', 'job', 'category_id', 'category', 'id', 'CASCADE', 'CASCADE');
        $this->addForeignKey('fk_job_user_created_by', 'job', 'created_by', 'user', 'id', 'CASCADE', 'CASCADE');
        $this->addForeignKey('fk_job_user_updated_by', 'job', 'updated_by', 'user', 'id', 'CASCADE', 'CASCADE');
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
		$this->dropForeignKey('fk_job_category', 'job');
        $this->dropForeignKey('fk_job_user_created_by', 'job');
        $this->dropForeignKey('fk_job_user_updated_by', 'job');
        $this->dropTable('job');
    }
}
