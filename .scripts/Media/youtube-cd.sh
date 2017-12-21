#!/usr/bin/env bash

set -e

ALBUM=$1
PLAYLIST=$2

mkdir -p "$ALBUM"
cd "$ALBUM"

youtube-dl --extract-audio --audio-format wav "$PLAYLIST"
drutil burn -audio .

cd ..
