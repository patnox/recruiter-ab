<?php
namespace console\controllers;

use Yii;
use yii\console\Controller;

class RbacController extends Controller
{
    public function actionInit()
    {
        $auth = Yii::$app->authManager;

        /**
         * Permissions
         */

        // create and add "createJob" permission
        $createJob = $auth->createPermission('createJob');
        $createJob->description = 'User can create a job';
        $auth->add($createJob);

        // create and add "updateJob" permission
        $updateJob = $auth->createPermission('updateJob');
        $updateJob->description = 'User can update job';
        $auth->add($updateJob);

        /**
         * Roles
         */

        // create and add "user" role
        $user = $auth->createRole('user');
        $auth->add($user);

        // create and add "author" role
        $author = $auth->createRole('author');
        $auth->add($author);

        // create and add "admin" role
        $admin = $auth->createRole('admin');
        $auth->add($admin);

        /**
         * Mutual connections
         */

        // "author" can create new Job
        $auth->addChild($author, $createJob);

        // "admin" can do everything what "author" can
        $auth->addChild($admin, $author);
        // ... and ...
        // "admin" can update ALL Jobs
        $auth->addChild($admin, $updateJob);
    }
	
	public function actionCreateAuthorRule()
	{
		$auth = Yii::$app->authManager;

		// add the rule
		$rule = new \console\rbac\AuthorRule();
		$auth->add($rule);

		// add the "updateOwnJob" permission and associate the rule with it.
		$updateOwnJob = $auth->createPermission('updateOwnJob');
		$updateOwnJob->description = 'Update own job';
		$updateOwnJob->ruleName = $rule->name;
		$auth->add($updateOwnJob);

		// get the "updateJob" permission
		$updateJob = $auth->getPermission('updateJob');

		// get the "author" role
		$author = $auth->getRole('author');

		// "updateOwnJob" will be used from "updateJob"
		$auth->addChild($updateOwnJob, $updateJob);

		// allow "author" to update their own Jobs
		$auth->addChild($author, $updateOwnJob);
	}
}