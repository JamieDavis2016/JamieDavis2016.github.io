Build MERN stack and deploy it to a server (raspberry Pi)

MERN stack: MongoDB, Express. js, AngularJS, and Node. js

Setup MERN stack on lcoal PC - THEN PUSH TO GIT?


Step 1: Install Node on your raspberry Pi (and on your local computer)

<code>sudo apt-get update
sudo apt-get install nodejs
</code>

Then install npm: 

<code>sudo apt-get install npm</code>

Check Node is installed on your system:

<code> nodejs -v </code>
 
Step 2: Setup Node server using express

Step 3: Install MongoDB

<code> sudo apt-get install mongodb</code>

install git

clone pushed repo

sudo git clone github repo

cd /var/www/mernstack/MERN-Stack-demo

<code>sudo node index.js</code>

Open second session and do this: <code>curl localhost:5000</code>

Should see "welcome to express!"

# Now lets get the node app running with nginx so you can see it on your machine! 

For some reason my builds aren't being pushed to travis?


https://www.toptal.com/raspberry-pi/how-to-turn-your-raspberry-pi-into-a-development-server
