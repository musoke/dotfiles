#! /bin/bash

# Fetch the latest picture from Astronomy Picture of the Day and save to ~/.apod.jpg

prefix=https://apod.nasa.gov/apod/
#postfix=ap160305.html
postfix=astropix.html

# Get the latest picture
curl -s -o ~/.apod.jpg $(curl -s ${prefix}${postfix}  | tac | tac | grep -Pom1 'image/\d+/.*\.jpg' | cat <(printf "$prefix") <(cat -))
