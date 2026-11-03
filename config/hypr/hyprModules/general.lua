-- General

-- Refer to https://wiki.hypr.land/configuring/core/config-options/
hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 12,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(cba6f7ee)", "rgba(89b4faee)"}, angle = 90 },
            inactive_border = "rgba(1e1e2e00)",
        },

        resize_on_border = false,
        allow_tearing    = false,

        layout = "dwindle",
    },
})
