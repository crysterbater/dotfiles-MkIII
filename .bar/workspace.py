#!/usr/bin/env python3

import i3ipc

# Create the Connection object that can be used to send commands and subscribe
# to events.
i3 = i3ipc.Connection()
coloractive = '%{F{{ n_cyan }} }'
colorinactive = '%{F{{ bgc }} }'
colorwarning = '%{F{{ n_red }} }'
bgactive = '%F{{{ fgc }} }'
bginactive = '%F{{{ fgc }} }'
colorreset = '%{F{{ bgc }} }'

# Define a callback to be called when you switch workspaces.
def on_workspace_focus(self, e):
    workspace_string = '   '
    workspaces = i3.get_workspaces()

    ws_nums = [int(n['num']) for n in workspaces]
    focused = [n['visible'] for n in workspaces].index(True)
    urg = [n for n, _ in enumerate(workspaces) if workspaces[n]['urgent'] == True]
    names =[''.join([i for i in n['name'] if not i.isdigit()]) for n in workspaces]

    for n in range(len(ws_nums)):
        if focused == n:
            workspace_string += coloractive + bgactive + names[n] + '  '
        elif n in urg:
            workspace_string += colorwarning + bgactive + names[n] + '  '
        else:
            workspace_string += colorinactive + bginactive + names[n] + '  '

    print(workspace_string, flush=True)

workspace_string = '    '
workspaces = i3.get_workspaces()

ws_nums = [int(n['num']) for n in workspaces]
focused = [n['visible'] for n in workspaces].index(True)
urg = [n for n, _ in enumerate(workspaces) if workspaces[n]['urgent'] == True]
names =[''.join([i for i in n['name'] if not i.isdigit()]) for n in workspaces]

for n in range(len(ws_nums)):
    if focused == n:
        workspace_string += coloractive + names[n] + 'x  '
    elif n in urg:
        workspace_string += colorwarning + names[n] + 'o  '
    else:
        workspace_string += colorinactive + names[n] + '-  '

workspace_string += colorreset

print(workspace_string, flush=True)

# Subscribe to events
i3.on('workspace', on_workspace_focus)

# Start the main loop and wait for events to come in.
i3.main()

