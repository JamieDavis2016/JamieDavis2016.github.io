#!/bin/bash
set -xe
if [ $TRAVIS_BRANCH == 'master' ] ; then
    # Initialize a new git repo in _site, and push it to our server.
    ls -al ~/.ssh
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    ssh-keygen -p -P "" -N "" -f ~/.ssh/id_rsa

    cd ./dist
    git init
        
    git remote add deploy "travis@itsbeenjamied.co.uk:/var/repo/blogsite.git"
    git config user.name "Travis CI"
    git config user.email "jamiehdavis96+travis@gmail.com"
    
    git add -v . 
    git commit -m "Deploy V2"
    git push deploy master --force

else
    echo "Not deploying, since this branch isn't master."
fi