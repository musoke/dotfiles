#!/usr/bin/env bash

bg_pic='/tmp/lockscreen.png'

import -window root "$bg_pic"

mogrify -scale 10% -scale 1000% "$bg_pic"

i3lock -i "$bg_pic"

