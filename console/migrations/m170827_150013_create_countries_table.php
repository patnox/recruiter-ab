<?php

use yii\db\Migration;

/**
 * Handles the creation of table `countries`.
 */
class m170827_150013_create_countries_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('countries', [
            'id' => $this->primaryKey(),
			'country_code' => $this->string(2)->notNull(),
			'country_name' => $this->string(128)->notNull(),
        ]);
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropTable('countries');
    }
}
