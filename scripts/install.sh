#!/bin/bash
set -x # Show the output of the following commands (useful for debugging)

# Import the SSH deployment key

#openssl aes-256-cbc -K  $encrypted_92725ca94bf5_key -iv $encrypted_92725ca94bf5_iv -in travis_rsa.enc -out travis_rsa

#- openssl aes-256-cbc -K $encrypted_0ddd2445e49f_key -iv $encrypted_0ddd2445e49f_iv -in travis_rsa.enc -out travis_rsa -d
rm travis_rsa.enc # Don't need it anymore
chmod 600 travis_rsa
mv travis_rsa ~/.ssh/id_rsa