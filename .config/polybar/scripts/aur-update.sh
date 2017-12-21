#!/usr/bin/env bash

if [[ `cower -u | wc -l` > 0 ]]; then
    termite --geometry=750x550 --exec="yaourt -Syu"
fi
