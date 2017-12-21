#!/bin/bash

# Launch python script in its proper virtual environment
cd $(dirname $0)
source /home/dead/.config/polybar/Backups/test/polybar/news/postactivate

./news.py "$@"
