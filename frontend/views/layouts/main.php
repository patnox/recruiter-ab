<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use common\widgets\Alert;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <?php
    NavBar::begin([
        'brandLabel' => 'Recruiter AB',
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
        ],
    ]);
    $menuItems = [
        ['label' => 'Home', 'url' => ['/site/index']],
        ['label' => 'About', 'url' => ['/site/about']],
        ['label' => 'Contact', 'url' => ['/site/contact']],
    ];
    if (Yii::$app->user->isGuest) 
	{
        $menuItems[] = ['label' => 'Signup', 'url' => ['/site/signup']];
        $menuItems[] = ['label' => 'Login', 'url' => ['/site/login']];
    } 
	else 
	{
		$jobmenuItems[] = ['label' => 'Job Search', 'url' => ['/job/search']];
		$jobmenuItems[] = ['label' => 'Jobs List', 'url' => ['/job/index']];
		$jobmenuItems[] = ['label' => 'Self Applications', 'url' => ['/jobapplication/index']];
		$jobmenuItems[] = ['label' => 'Self Interviews', 'url' => ['/jobinvitation/index']];
		$menuItems[] = ['label' => 'Jobs', 'items' => $jobmenuItems];
		$talentmenuItems[] = ['label' => 'Create Job', 'url' => ['/job/create']];
		$talentmenuItems[] = ['label' => 'Talent Search', 'url' => ['/profile/search']];
		$talentmenuItems[] = ['label' => 'Talent Applications', 'url' => ['/jobapplication/talent']];
		$talentmenuItems[] = ['label' => 'Talent Interviews', 'url' => ['/jobinvitation/talent']];
		$menuItems[] = ['label' => 'Talent', 'items' => $talentmenuItems];
		$menuItems[] = ['label' => 'Profile', 'url' => ['/userprofile/index']];
        $menuItems[] = '<li>'
            . Html::beginForm(['/site/logout'], 'post')
            . Html::submitButton(
                'Logout (' . Yii::$app->user->identity->username . ')',
                ['class' => 'btn btn-link logout']
            )
            . Html::endForm()
            . '</li>';
    }
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => $menuItems,
    ]);
    NavBar::end();
    ?>

    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; Recruiter AB <?= date('Y') ?></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
