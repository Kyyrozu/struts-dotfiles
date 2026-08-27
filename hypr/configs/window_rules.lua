-- Fix some dragging issues with XWayland -- MIGHT NOT BE REQUIRED ANYMORE
hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },

    no_focus = true,
})

hl.on("window.open", function(w)
    if w.class == "xwaylandvideobridge" then
        hl.dispatch(hl.dsp.window.kill({ window = w }))
    end
end)

hl.workspace_rule({workspace = "1", monitor = "HDMI-A-1"})
hl.workspace_rule({workspace = "3", monitor = "DP-1"})
hl.workspace_rule({workspace = "10", monitor = "HDMI-A-1"})

-- Smart gaps -- settings from the wiki
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, rounding = 0 })

hl.window_rule({
	name = "set signal workspace",
	match = { class = "org.signal.Signal" },
	workspace = "1"
})
hl.window_rule({
	name = "set discord workspace",
	match = { class = "discord" },
	workspace = "1"
})
hl.window_rule({
	name = "set spotify workspace",
	match = { class = "spotify" },
	workspace = "10"
})
