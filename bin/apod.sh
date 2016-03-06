#! /bin/bash

# Fetch the latest picture from Astronomy Picture of the Day and save to ~/.apod.jpg

prefix=http://apod.nasa.gov/apod/
#postfix=ap160305.html
postfix=astropix.html

# Get the latest picture
curl -s -o ~/.apod.jpg $(curl -s ${prefix}${postfix} | grep -Pom1 'image/\d+/.*\.jpg' | cat <(printf "$prefix") <(cat -))
