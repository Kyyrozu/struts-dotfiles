-- Bootstrap: load the modular config files below, in the same order the old
-- hyprland.conf sourced their .conf equivalents.
local configs = os.getenv("HOME") .. "/.config/hypr/configs"

require(configs .. "/settings.lua")
require(configs .. "/keybinds.lua")
require(configs .. "/startup.lua")
require(configs .. "/variables.lua")
require(configs .. "/window_rules.lua")
require(configs .. "/animations.lua")
