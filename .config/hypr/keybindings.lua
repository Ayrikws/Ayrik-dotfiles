
----------------------
--  KEYBINDINGS  --
----------------------

local mainMod = "SUPER"
local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "rofi -show"

---------------------
-- CORE KEYBINDINGS --
---------------------
hl.bind(mainMod, "Return", "exec", terminal)
hl.bind(mainMod, "Q", "killactive")
hl.bind(mainMod, "Delete", "exit")
hl.bind(mainMod, "E", "exec", fileManager)
hl.bind(mainMod, "D", "exec", menu)
hl.bind(mainMod, "R", "exec", "~/.config/waybar/scripts/launch.sh")
hl.bind(mainMod, "V", "exec", "~/.local/bin/clipboard-manager.sh")
hl.bind(mainMod, "H", "exec", "hyprpicker -a")
hl.bind(mainMod, "N", "exec", "/usr/bin/rofi-noter")
hl.bind(mainMod, "W", "exec", "python ~/.config/ayrik/ayrik.py --action select-wallpaper")
hl.bind(mainMod, "T", "exec", "Telegram")
hl.bind(mainMod, "G", "exec", "ghostty")

hl.bind(mainMod .. "_SHIFT", "L", "exec", "hyprlock")
hl.bind(mainMod .. "_SHIFT", "Z", "exec", "app.zen_browser.zen")
hl.bind(mainMod .. "_SHIFT", "F", "exec", "firefox")
hl.bind(mainMod .. "_SHIFT", "O", "exec", "obsidian")
hl.bind(mainMod .. "_SHIFT", "T", "exec", "thorium-browser-avx2")
hl.bind(mainMod .. "_SHIFT", "S", "exec", "hyprshot -m window")
hl.bind(mainMod .. "_SHIFT", "C", "centerwindow")

hl.bind("CTRL_SHIFT", "R", "exec", "hyprctl reload")
hl.bind("", "PRINT", "exec", "hyprshot -m output")

------------------------
-- WORKSPACE ROUTING --
------------------------
-- Clean Lua loop to generate workspace binds 1-10 dynamically
for i = 1, 9 do
    hl.bind(mainMod, tostring(i), "workspace", tostring(i))
    hl.bind(mainMod .. "_SHIFT", tostring(i), "movetoworkspace", tostring(i))
end
-- Handle workspace 10 mapped to '0'
hl.bind(mainMod, "0", "workspace", "10")
hl.bind(mainMod .. "_SHIFT", "0", "movetoworkspace", "10")

hl.bind(mainMod .. "_CTRL", "Right", "workspace", "r+1")
hl.bind(mainMod .. "_CTRL", "Left", "workspace", "r-1")
hl.bind(mainMod .. "_CTRL", "Down", "workspace", "empty")
hl.bind(mainMod, "mouse_down", "workspace", "r+1")
hl.bind(mainMod, "mouse_up", "workspace", "r-1")

-----------------------
-- WINDOW MANAGEMENT --
-----------------------
hl.bind(mainMod .. "_ALT", "Space", "togglegroup")
hl.bind(mainMod, "Space", "togglefloating")
hl.bind(mainMod, "F", "fullscreen")

-- Window Resizing (Repeatable binds)
hl.binde(mainMod .. "_SHIFT", "Right", "resizeactive", "30 0")
hl.binde(mainMod .. "_SHIFT", "Left", "resizeactive", "-30 0")
hl.binde(mainMod .. "_SHIFT", "Up", "resizeactive", "0 -30")
hl.binde(mainMod .. "_SHIFT", "Down", "resizeactive", "0 30")

-- Window Moving
hl.bind(mainMod .. "_SHIFT_CTRL", "Right", "movewindow", "r")
hl.bind(mainMod .. "_SHIFT_CTRL", "Left", "movewindow", "l")
hl.bind(mainMod .. "_SHIFT_CTRL", "Up", "movewindow", "u")
hl.bind(mainMod .. "_SHIFT_CTRL", "Down", "movewindow", "d")

-- Mouse Binds
hl.bindm(mainMod, "mouse:272", "movewindow")
hl.bindm(mainMod, "mouse:273", "resizewindow")

---------------------------
-- HYPRSCROLLING LAYOUT --
---------------------------
hl.bind(mainMod, "Right", "layoutmsg", "move +col")
hl.bind(mainMod, "Left", "layoutmsg", "move -col")
hl.bind(mainMod, "P", "layoutmsg", "promote")
hl.bind(mainMod, "L", "layoutmsg", "togglefit")
hl.bind(mainMod .. "_SHIFT", "E", "layoutmsg", "fit active")

hl.bind(mainMod .. "_ALT", "Left", "layoutmsg", "swapcol l")
hl.bind(mainMod .. "_ALT", "Right", "layoutmsg", "swapcol r")
hl.bind(mainMod .. "_ALT", "Up", "swapwindow", "u")
hl.bind(mainMod .. "_ALT", "Down", "swapwindow", "d")

hl.bind(mainMod .. "_SHIFT", "Right", "layoutmsg", "colresize +0.1")
hl.bind(mainMod .. "_SHIFT", "Left", "layoutmsg", "colresize -0.1")

-----------------------
-- HARDWARE CONTROLS --
-----------------------
-- Audio and Brightness (Locked + Repeatable)
hl.bindel("", "XF86AudioRaiseVolume", "exec", "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")
hl.bindel("", "XF86AudioLowerVolume", "exec", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
hl.bindel("", "XF86AudioMute", "exec", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
hl.bindel("", "XF86AudioMicMute", "exec", "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")
hl.bindel("", "XF86MonBrightnessUp", "exec", "brightnessctl -e4 -n2 set 5%+")
hl.bindel("", "XF86MonBrightnessDown", "exec", "brightnessctl -e4 -n2 set 5%-")

-- Hyprsunset Gamma Keybinds
hl.bindel("", "XF86MonBrightnessDown", "exec", "hyprctl hyprsunset gamma -10")
hl.bindel("", "XF86MonBrightnessUp", "exec", "hyprctl hyprsunset gamma +10")

-- Media Player Controls (Locked binds)
hl.bindl("", "XF86AudioNext", "exec", "playerctl next")
hl.bindl("", "XF86AudioPause", "exec", "playerctl play-pause")
hl.bindl("", "XF86AudioPlay", "exec", "playerctl play-pause")
hl.bindl("", "XF86AudioPrev", "exec", "playerctl previous")
