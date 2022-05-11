#!/bin/bash

set -e

./fontbm --font-file resources/fonts/Symbola.ttf --chars 48-52 --font-size 48 --output resources/fonts/symbola_48
./fontbm --font-file resources/fonts/Symbola.ttf --chars 48-57,8586,8587 --font-size 100 --output resources/fonts/symbola_100
#./fontbm --font-file resources/fonts/Symbola.ttf --chars 48-57,58,8586,8587 --output resources/fonts/symbola_84