-- Autostart

-- See https://wiki.hypr.land/configuring/core/autostart/
hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("dunst")
    hl.exec_cmd("hyprctl setcursor catppuccin-mocha-mauve-cursors 24")

    -- Workaround: recompute monitor layout after all displays settle
    -- (DP-2 lags HDMI/DP-1 at startup, leaving the cursor clamped to their bounds).
    hl.exec_cmd("sleep 2 && hyprctl reload")

    -- Make DP-1 the XWayland primary so X11/Proton games default to it (and offer 1440p)
    -- instead of falling back to the first output (rotated 1080p HDMI-A-1).
    hl.exec_cmd("sleep 3 && xrandr --output DP-1 --primary")

    -- clipboard manager
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)
