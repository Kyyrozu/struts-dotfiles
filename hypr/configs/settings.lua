local colors = dofile(os.getenv("HOME") .. "/.cache/wal/colors-hyprland.lua")

hl.monitor({ output = "DP-3", mode = "2560x1440@164.96", position = "0x0", scale = 1.333 })
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@100", position = "auto-left", scale = 1 })

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 0,
        border_size = 2,
        resize_on_border = true,

        col = {
            active_border = { colors = { colors.color6, colors.color3 }, angle = 90 },
            inactive_border = "rgba(000000A0)",
        },

        layout = "dwindle",
    },

    group = {
        col = {
            border_active = colors.color6,
        },
        groupbar = {
            col = {
                active = colors.color6,
            },
        },
    },

    decoration = {
        rounding = 10,

        active_opacity = 1.0,
        inactive_opacity = 1.0,
        fullscreen_opacity = 1.0,

        dim_inactive = true,
        dim_strength = 0.1,

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    dwindle = {
        preserve_split = true,
        special_scale_factor = 0.8,
    },

    binds = {
        workspace_back_and_forth = 0,
        allow_workspace_cycles = 1,
        pass_mouse_when_bound = 0,
    },

    -- Could help when scaling and not pixelating
    xwayland = {
        force_zero_scaling = true,
    },
})
