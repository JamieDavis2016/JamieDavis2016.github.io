#!/bin/bash

set DEV_ENV=production
jekyll build
htmlproofer ./_site --disable-external