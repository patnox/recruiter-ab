<?php

/* @var $this yii\web\View */

$this->title = 'Recruiter - Main';
?>
<div class="site-index">

    <div class="jumbotron">
        <h1>Need a Job?</h1>

        <p class="lead">Browse our open job listings or recruit talent from our user pool.</p>

        <p><a class="btn btn-lg btn-success" href="index.php?r=job/index">Start Browsing</a></p>
    </div>

    <div class="body-content">

        <div class="row">
            <div class="col-lg-4">
                <h2>Browse Listings</h2>

                <p>Browse our list of thousands of job listings put up my multiple employers.</p>

                <p><a class="btn btn-default" href="index.php?r=job/index">Browse Listings &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <h2>Recruit Talent</h2>

                <p>Recruit talent from our list of candidates.</p>

                <p><a class="btn btn-default" href="index.php?r=site/login">Recruit Talent &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <h2>Free to Join</h2>

                <p>Join our site for free and search for jobs or recruit talent.</p>

                <p><a class="btn btn-default" href="index.php?r=site/login">Free to Join &raquo;</a></p>
            </div>
        </div>

    </div>
</div>
