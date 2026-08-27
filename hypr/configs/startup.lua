hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("/usr/bin/kwalletd6 &")
	hl.exec_cmd("kwallet-query -l kdewallet")
    hl.exec_cmd("waybar &")
    hl.exec_cmd("nm-applet --indicator &")
    hl.exec_cmd("swaync &")
    hl.exec_cmd("hypridle &")
    hl.exec_cmd("hyprpaper &")


	-- Start applications
	hl.exec_cmd("flatpak run com.discordapp.Discord", {silent = true})
	hl.exec_cmd("flatpak run com.signal.Signal", {silent = true})
	hl.dsp.focus({workspace = "3"})
	hl.exec_cmd("flatpak run app.zen_browser.zen")

end)
