#!/bin/bash

# docker run --rm -v $PWD:/home/marp/app/ -e LANG=ja_JP.UTF-8 marpteam/marp-cli -I ./ -o ./dist

npx @marp-team/marp-cli@latest -I ./ -o ./dist
