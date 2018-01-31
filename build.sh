#!/bin/bash
#=================================================
# name:   build.sh
# author: Pawel Bogut <http://pbogut.me>
# date:   31/01/2018
#=================================================
docker run --rm --volume="$PWD:/srv/jekyll" -it jekyll/jekyll jekyll build $@
