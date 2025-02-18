#!/bin/bash

docker run --rm -u root -v $PWD:/home/marp/app/ -e LANG=ja_JP.UTF-8 marpteam/marp-cli -I ./ -o ./dist --pdf

# npx @marp-team/marp-cli@latest -I ./ -o ./dist --pdf
