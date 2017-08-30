<?php

use yii\db\Migration;

/**
 * Handles the creation of table `job_application`.
 */
class m170829_173202_create_job_application_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('job_application', [
            'id' => $this->primaryKey(),
			'user_id' => $this->integer()->notNull(),
			'job_id' => $this->integer()->notNull(),
			'application_date' => $this->datetime()->notNull(),
			'invited' => $this->integer()->defaultValue(0),
			'cover_letter' => $this->text()->notNull(),
			'type' => $this->integer()->defaultValue(0),
        ]);
		
		$this->createIndex('job_application_index', 'job_application', ['user_id', 'job_id', 'application_date', 'invited', 'type']);
		$this->addForeignKey('fk_job_application_user', 'job_application', 'user_id', 'user', 'id', 'CASCADE', 'CASCADE');
		$this->addForeignKey('fk_job_application_job', 'job_application', 'job_id', 'job', 'id', 'CASCADE', 'CASCADE');
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
		$this->dropForeignKey('fk_job_application_user', 'job_application');
        $this->dropForeignKey('fk_job_application_job', 'job_application');
        $this->dropTable('job_application');
    }
}
