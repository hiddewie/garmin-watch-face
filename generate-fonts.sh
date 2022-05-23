#!/bin/bash

set -e

./fontbm --font-file "resources/fonts/PragmataPro Liga Regular.ttf" --chars 48-52 --font-size 48 --output resources/fonts/PragmataPro_48
./fontbm --font-file "resources/fonts/PragmataPro Liga Regular.ttf" --chars 48-57,8586,8587 --font-size 100 --output resources/fonts/PragmataPro_100