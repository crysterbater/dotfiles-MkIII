#!/usr/bin/python3
"""
Simple power menu for rofi.
"""
import sys
import subprocess
from collections import OrderedDict
 
CHOICES = OrderedDict((
    ('Lock screen', '/home/alphare/.config/i3/block_lock.sh'),
    ('Shutdown', 'init 0'),
    ('Reboot', 'reboot'),
    ('Logout', 'i3-msg exit'),
))
 
 
def print_choices():
    print('(empty)')
    for choice in CHOICES.keys():
        # This will also be passed to CHOICES, so it has to be one of its keys
        print(choice)
 
 
def power_menu():
    try:
        # Commands might be multiple words long
        arguments = sys.argv[1:]
        choice = " ".join(arguments)
        split_bash_command = CHOICES[choice].split()
 
        # Popen ensures the child process still live even if rofi exits
        subprocess.Popen(split_bash_command, stdout=subprocess.PIPE)
 
    except (KeyError, IndexError):
        # Fine for this program's purposes
        # Will trigger if no arguments are provided or if they are not in CHOICES
        print_choices()
 
 
if __name__ == '__main__':
    power_menu()
