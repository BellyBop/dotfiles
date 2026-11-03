-- Input

-- See https://wiki.hypr.land/configuring/core/input/
hl.config({
    input = {
        kb_layout = "us",

        sensitivity    = 0, -- -1.0 - 1.0, 0 means no modification.
        force_no_accel = true,

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- See https://wiki.hypr.land/configuring/core/gestures/
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})
