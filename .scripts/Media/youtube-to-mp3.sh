#! /bin/bash
# args: youtube playlist url

youtube-dl --extract-audio --audio-format mp3 --yes-playlist "$1"
