#!/usr/bin/env bash
printf "%s" $(nmcli device wifi | grep -v SSID | grep "*" | cut -d' ' -f3)
