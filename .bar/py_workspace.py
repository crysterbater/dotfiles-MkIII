#!/usr/bin/env python3

import sys
import i3ipc
import re
from argparse import ArgumentParser

# Create the Connection object that can be used to send commands and subscribe
# to events.
i3 = i3ipc.Connection()
coloractive = '%{F{{ n_red }} }'
foreground = '%{F{{ bgc }} }'

# Define a callback to be called when you switch workspaces.
def on_workspace_focus(self, e):
    workspace_string = ''
    workspaces = i3.get_workspaces()

    focused = i3.get_tree().find_focused().workspace()

    numbered_workspaces = filter(lambda w: w.name[0].isdigit(), workspaces)
    numbers = list(map(lambda w: int(re.search(r'^([0-9]+)', w.name).group(0)), numbered_workspaces))

    for n in numbers:
        if focused:
            if focused.num == n:
                workspace_string += foreground + coloractive + str('⮛') + foreground + ' '
            else:
                workspace_string += foreground + str('⮛') + ' '
        else:
            workspace_string += foreground + str('⮛') + ' '


    print('  ' +workspace_string)
    sys.stdout.flush()
# Subscribe to events
i3.on('workspace::focus', on_workspace_focus)

# Start the main loop and wait for events to come in.
i3.main()
