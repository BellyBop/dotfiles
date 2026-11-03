#!/usr/bin/env python3
# Listens to Hyprland events and tells waybar to refresh the workspace modules (signal 8).
import os, socket, subprocess, fcntl
_lock = open(f"{os.environ['XDG_RUNTIME_DIR']}/waybar-ws-listen.lock", "w")
try: fcntl.flock(_lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
except OSError: raise SystemExit  # another bar already runs the listener
path = f"{os.environ['XDG_RUNTIME_DIR']}/hypr/{os.environ['HYPRLAND_INSTANCE_SIGNATURE']}/.socket2.sock"
s = socket.socket(socket.AF_UNIX); s.connect(path)
keys = ("workspace", "focusedmon", "createworkspace", "destroyworkspace", "movewindow", "openwindow", "closewindow", "moveworkspace", "monitoradded", "monitorremoved")
buf = b""
while True:
    data = s.recv(4096)
    if not data: break
    buf += data
    *lines, buf = buf.split(b"\n")
    if any(l.split(b">>")[0].decode(errors="ignore") in keys for l in lines):
        subprocess.run(["pkill", "-RTMIN+8", "-x", "waybar"])
