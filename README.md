Recruiter AB
===============================

Recruiter AB is a job recruitment site using YII 2 PHP Framework technology. Recruiter is committed to the goal of maximizing the opportunities for all job seekers and employers.

Features
--------

```
1. User Profiles - Users create accounts and update their information
2. Job Listing - Users can create jobs
3. Job Applications - Users can apply for jobs
4. Talent Search - Users can search through other users profiles and invite them for interview
5. Opportunities - Users get notified of any interviews or applications targeted to their profile
6. Notifications - Users get notified of messages through their portal and through email

```

Menu
----

```
1. Home - The site landing page
2. About - An introduction to the site
3. Contact US - A form to send us a message
4. Jobs - Job Seekers Menu
	4.1. Job Search - Search for available jobs
	4.2. Jobs List - List of available jobs
	4.3. Self Applications - List of jobs you have applied for
	4.4. Self Interviews - List of interviews you have been invited for (Accept or Decline)
5. Talent - Employers Menu
	5.1. Create Job - Create a job listing
	5.2. Talent Search - Search for talent in user profiles
	5.3. Talent Applications - View list of users who have applied to your jobs (Accept & [invite for interview] or Decline)
	5.4. Talent Interviews - View list of users you have invited to interview and whether accepted or not
6. Profile - Your user profile (intro, job history, education history etc)
7. Auth (login & logoff)

```

DIRECTORY STRUCTURE
-------------------

```
common
    config/              contains shared configurations
    mail/                contains view files for e-mails
    models/              contains model classes used in both backend and frontend
    tests/               contains tests for common classes    
console
    config/              contains console configurations
    controllers/         contains console controllers (commands)
    migrations/          contains database migrations
    models/              contains console-specific model classes
    runtime/             contains files generated during runtime
backend
    assets/              contains application assets such as JavaScript and CSS
    config/              contains backend configurations
    controllers/         contains Web controller classes
    models/              contains backend-specific model classes
    runtime/             contains files generated during runtime
    tests/               contains tests for backend application    
    views/               contains view files for the Web application
    web/                 contains the entry script and Web resources
frontend
    assets/              contains application assets such as JavaScript and CSS
    config/              contains frontend configurations
    controllers/         contains Web controller classes
    models/              contains frontend-specific model classes
    runtime/             contains files generated during runtime
    tests/               contains tests for frontend application
    views/               contains view files for the Web application
    web/                 contains the entry script and Web resources
    widgets/             contains frontend widgets
vendor/                  contains dependent 3rd-party packages
environments/            contains environment-based overrides

```

INSTALLATION
------------

```
1. Upload the files to your server
2. Point the document root of your Web server to the frontend/web
3. configs:

Recommended Apache Configuration:

Use the following configuration in Apache's httpd.conf file or within a virtual host configuration. Note that you should replace path/to/frontend/web with the actual path for frontend/web.

# Set document root to be "frontend/web"
DocumentRoot "path/to/frontend/web"

<Directory "path/to/frontend/web">
    # use mod_rewrite for pretty URL support
    RewriteEngine on
    # If a directory or a file exists, use the request directly
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    # Otherwise forward the request to index.php
    RewriteRule . index.php

    # ...other settings...
</Directory>

Recommended Nginx Configuration:

To use Nginx, you should install PHP as an FPM SAPI. You may use the following Nginx configuration, replacing path/to/frontend/web with the actual path for frontend/web and mysite.local with the actual hostname to serve.

server {
    charset utf-8;
    client_max_body_size 128M;

    listen 80; ## listen for ipv4
    #listen [::]:80 default_server ipv6only=on; ## listen for ipv6

    server_name mysite.local;
    root        /path/to/frontend/web;
    index       index.php;

    access_log  /path/to/frontend/log/access.log;
    error_log   /path/to/frontend/log/error.log;

    location / {
        # Redirect everything that isn't a real file to index.php
        try_files $uri $uri/ /index.php$is_args$args;
    }

    # uncomment to avoid processing of calls to non-existing static files by Yii
    #location ~ \.(js|css|png|jpg|gif|swf|ico|pdf|mov|fla|zip|rar)$ {
    #    try_files $uri =404;
    #}
    #error_page 404 /404.html;

    # deny accessing php files for the /assets directory
    location ~ ^/assets/.*\.php$ {
        deny all;
    }

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_pass 127.0.0.1:9000;
        #fastcgi_pass unix:/var/run/php5-fpm.sock;
        try_files $uri =404;
    }

    location ~* /\. {
        deny all;
    }
}

When using this configuration, you should also set cgi.fix_pathinfo=0 in the php.ini file in order to avoid many unnecessary system stat() calls.

Also note that when running an HTTPS server, you need to add fastcgi_param HTTPS on; so that Yii can properly detect if a connection is secure.

```

