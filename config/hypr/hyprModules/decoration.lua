-- Decoration

hl.config({
    decoration = {
        rounding       = 20,
        rounding_power = 2,

        active_opacity   = 1,
        inactive_opacity = 1,

        shadow = {
            enabled       = false,
            range         = 12,
            render_power  = 4, -- max allowed is 4 (was 5 in the old .conf)
            color         = "rgba(6600ccaa)",
            color_inactive = "rgba(00000000)",
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },
})
