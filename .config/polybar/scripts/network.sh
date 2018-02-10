#!/usr/bin/env bash

online=$(ip addr | grep "state UP" | cut -d ":" -f2)

connected=""
offline=""
#connected=""
#offline=""
if [[ "$online" ]]; then
  echo " %{F${xrdb:color4:#222}}${connected} "
else
  echo " %{F${xrdb:color6:#222}}${offline} "; sleep 1; echo " %{F${xrdb:color9:#222}}${offline} "
fi
