#!/usr/bin/env python2
from pydbus import SystemBus
from gi.repository import GLib
import os
import sys
import datetime

system_bus = SystemBus()

display_device = system_bus.get(".UPower", "/org/freedesktop/UPower/devices/DisplayDevice")
# upower.Get(".Device", )

STATE_UNKNOWN=0
STATE_CHARGING=1
STATE_DISCHARGING=2
STATE_EMPTY=3
STATE_FULL=4
STATE_PENDING_CHARGE=5
STATE_PENDING_DISCHARGE=6

data = display_device.GetAll("org.freedesktop.UPower.Device")
state = data["State"]
percentage = data["Percentage"]
time_until = data["TimeToFull"] if data["State"] == STATE_CHARGING else data["TimeToEmpty"]
icon = data["IconName"]

def on_change(iface, changed_data, args):
    global state, percentage, icon, time_until

    data = changed_data
    # data = display_device.GetAll("org.freedesktop.UPower.Device")
    # print("got", data)

    if "State" in data:
        state = data["State"]

    if "Percentage" in data:
        percentage = data["Percentage"]

    if "IconName" in data:
        icon = data["IconName"]

    if "TimeToEmpty" in data:
        time_until = data["TimeToEmpty"]
    elif "TimeToFull" in data:
        time_until = data["TimeToFull"]

    print_status()

def print_status():
    global state, percentage, icon, time_until

    if state in (STATE_CHARGING, STATE_DISCHARGING) and time_until > 60:
        hours = time_until // 3600
        minutes = (time_until - hours * 3600) // 60
        # seconds = (time_unti - hours * 3600 - minutes * 60)

        pretty_time = "%02i:%02i" % (hours, minutes)

        message = "%s\n" % (pretty_time)
    else:
        message = "%.2f%%\n" % (percentage)

    sys.stdout.write(message)
    sys.stdout.flush()


display_device.onPropertiesChanged = on_change

print_status()

try:
    GLib.MainLoop().run()
except KeyboardInterrupt:
    pass
