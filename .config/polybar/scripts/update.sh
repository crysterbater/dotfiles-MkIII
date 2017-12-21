#!/usr/bin/env bash

base=`checkupdates | wc -l`
aur=`cower -u | wc -l`
total=$(expr $base + $aur)

if [ "$total" > 0 ]; then
    termite --geometry=750x550 --exec="pacli"
fi

exit 0
