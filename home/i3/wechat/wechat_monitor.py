#!/usr/bin/python

import time
import i3ipc
import subprocess
import os
import re

_path = os.path.abspath(__file__)
_dir = os.path.dirname(_path)


def on_new_window(i3, event):
    window = event.container
    print(window.window_class, _path, _dir)
    if re.search(r'wxwork', window.window_class):
        time.sleep(0.2)
        subprocess.run(['sh', os.path.join(_dir, 'remove_wechat_shadow')])

# Create the Connection object to the i3 IPC interface
i3 = i3ipc.Connection()

# Subscribe to the window::new event
i3.on("window::new", on_new_window)

# Start the event loop
i3.main()

