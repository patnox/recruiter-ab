<?php

use yii\db\Migration;

/**
 * Handles the creation of table `job_invitation`.
 */
class m170829_173225_create_job_invitation_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('job_invitation', [
            'id' => $this->primaryKey(),
			'user_id' => $this->integer()->notNull(),
			'job_id' => $this->integer()->notNull(),
			'invitation_date' => $this->datetime()->notNull(),
			'target_date' => $this->datetime()->notNull(),
			'target_venue' => $this->string(128)->notNull(),
			'type' => $this->integer(),
			'accepted' => $this->integer()->defaultValue(0),
			'description' => $this->text()->notNull(),
        ]);
		
		$this->createIndex('job_invitation_index', 'job_invitation', ['user_id', 'job_id', 'invitation_date', 'target_date', 'type', 'target_venue', 'accepted']);
		$this->addForeignKey('fk_job_invitation_user', 'job_invitation', 'user_id', 'user', 'id', 'CASCADE', 'CASCADE');
		$this->addForeignKey('fk_job_invitation_job', 'job_invitation', 'job_id', 'job', 'id', 'CASCADE', 'CASCADE');
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
		$this->dropForeignKey('fk_job_invitation_user', 'job_invitation');
        $this->dropForeignKey('fk_job_invitation_job', 'job_invitation');
        $this->dropTable('job_invitation');
    }
}
