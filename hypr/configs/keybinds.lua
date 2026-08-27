local terminal = "kitty"
local fileManager = "dolphin"
local menu = "rofi"
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + escape", hl.dsp.exec_cmd("hyprctl dispatch exit 0"))
hl.bind(mainMod .. " + escape", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd("pkill " .. menu .. " || " .. menu .. " -show drun"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("flatpak run app.zen_browser.zen"))
hl.bind(mainMod .. " + P", hl.dsp.layout("togglesplit")) -- dwindle only

hl.bind(mainMod .. " + t", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + s", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + r", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + n", hl.dsp.focus({ direction = "right" }))

-- Move window position
hl.bind(mainMod .. " + SHIFT + t", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + s", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + r", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + n", hl.dsp.window.move({ direction = "right" }))

local workspaceKeys = { "quotedbl", "less", "greater", "parenleft", "parenright", "at", "plus", "minus", "slash", "asterisk" }
for i, key in ipairs(workspaceKeys) do
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- alternative workspace navigation binds
hl.bind(mainMod .. " + tab", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + SHIFT + tab", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Resize windows with ALT + R submap (escape to exit)
-- VERIFY: hl.dsp.window.resize()'s delta-argument shape (x/y + relative=true)
-- against https://wiki.hypr.land/Configuring/Basics/Binds/ -- this is inferred
-- from community reports, not confirmed against Hyprland's own example config.
hl.define_submap("resize", function()
    hl.bind("n", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind("t", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("r", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind("s", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
    hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("ALT + R", hl.dsp.submap("reset"))
end)
hl.bind("ALT + R", hl.dsp.submap("resize"))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 2%- -n 1"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Refresh waybar, swaync, rofi
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd("~/.config/hypr/scripts/refresh.sh"))
