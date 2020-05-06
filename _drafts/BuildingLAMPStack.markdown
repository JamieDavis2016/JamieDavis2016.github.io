---
layout: single
title:  "Building a LNMP (LAMP) Stack!"
date:   2020-05-03 13:44:23 +0100
categories: Raspberry Pi LNMP stack

---
Time To do: 30/1hr mins

Instead of a lamp stack it'll be a LNMP stack (replacing Apache with Nginx, and mysql with mariaDb)

<code>Run sudo apt-get install nginx</code>
<br />
Go to the IP Address of your raspberry Pi (on your browser) and you should see a welcome to nginx page!

![Welcome to nginx page](/assets/BuildLAMPStack/WelcomeToNginx.PNG)

Step 2: Install PHP

<code>sudo apt-get install php-fpm php-mysql</code>

You can check if PHP is installed by running <code>php -v</code>

![Welcome to nginx page](/assets/BuildLAMPStack/php-v.PNG)

Once you've done that you should then do this:

Go to <code>sudo nano /etc/nginx/sites-available/default </code>

And then change your config file to look like this:

![Welcome to nginx page](/assets/BuildLAMPStack/nginxPHPConfig.PNG)

Once changed, exit out of nano (ctrl-x and then y for yes to saving the changes)

Then run <code>nginx -t</code>
Once ran you should see a message saying that the configuration test is successful

After that run <code>sudo service nginx reload</code>

Go to where you created the PHP file and see if it loads!

That should be PHP setup!

Now to setup MySQL (Last part of the LANP stack!)

<code>sudo apt-get install mariadb-server-10.0</code>

This installs mariadb

<code>sudo mysql_secure_installation</code>

![MariaDB](/assets/BuildLAMPStack/mariadb.PNG)
Press continue
then y and type your password
press y three times 
and then y to reload prviilleges

This setups a password for the root user so we can use mariadb

To login run <code>sudo mysql</code>

Then you should be in your MariaDB client, to check a database exists run <code>show databases;</code>

<code>ctrl + c</code> to break out of mariaDB client and back into your terminal

And you should now have your LMNP stack working, here's a short breakdown of what you can do with it! Enjoy!
<section id="disqus_thread"></section>