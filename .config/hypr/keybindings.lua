----------------------
--    KEYBINDINGS    --
----------------------

local mainMod     = "SUPER"
local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "rofi -show"

---------------------
-- CORE KEYBINDINGS --
---------------------
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + Delete", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.config/waybar/scripts/launch.sh"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("~/.local/bin/clipboard-manager.sh"))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("/usr/bin/rofi-noter"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("python ~/.config/ayrik/ayrik.py --action select-wallpaper"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("Telegram"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("ghostty"))

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd("app.zen_browser.zen"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd("obsidian"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("thorium-browser-avx2"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprctl dispatch centerwindow"))

hl.bind("CTRL + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))

------------------------
-- WORKSPACE ROUTING --
------------------------
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.exec_cmd("hyprctl dispatch workspace " .. i))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace " .. i))
end
-- Handle workspace 10 mapped to '0'
hl.bind(mainMod .. " + 0", hl.dsp.exec_cmd("hyprctl dispatch workspace 10"))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace 10"))

hl.bind(mainMod .. " + CTRL + Right", hl.dsp.exec_cmd("hyprctl dispatch workspace r+1"))
hl.bind(mainMod .. " + CTRL + Left", hl.dsp.exec_cmd("hyprctl dispatch workspace r-1"))
hl.bind(mainMod .. " + CTRL + Down", hl.dsp.exec_cmd("hyprctl dispatch workspace empty"))
hl.bind(mainMod .. " + mouse_down", hl.dsp.exec_cmd("hyprctl dispatch workspace r+1"))
hl.bind(mainMod .. " + mouse_up", hl.dsp.exec_cmd("hyprctl dispatch workspace r-1"))

-----------------------
-- WINDOW MANAGEMENT --
-----------------------
hl.bind(mainMod .. " + ALT + Space", hl.dsp.exec_cmd("hyprctl dispatch togglegroup"))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("hyprctl dispatch togglefloating"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("hyprctl dispatch fullscreen"))

-- Window Resizing (Repeatable binds)
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 30 0"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.exec_cmd("hyprctl dispatch resizeactive -30 0"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -30"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 30"), { repeating = true })

-- Window Moving
hl.bind(mainMod .. " + SHIFT + CTRL + Right", hl.dsp.exec_cmd("hyprctl dispatch movewindow r"))
hl.bind(mainMod .. " + SHIFT + CTRL + Left", hl.dsp.exec_cmd("hyprctl dispatch movewindow l"))
hl.bind(mainMod .. " + SHIFT + CTRL + Up", hl.dsp.exec_cmd("hyprctl dispatch movewindow u"))
hl.bind(mainMod .. " + SHIFT + CTRL + Down", hl.dsp.exec_cmd("hyprctl dispatch movewindow d"))

-- Mouse Binds
hl.bind(mainMod .. " + mouse:272", hl.dsp.exec_cmd("hyprctl dispatch movewindow"), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.exec_cmd("hyprctl dispatch resizewindow"), { mouse = true })

---------------------------
-- HYPRSCROLLING LAYOUT --
---------------------------
hl.bind(mainMod .. " + Right", hl.dsp.exec_cmd("hyprctl dispatch layoutmsg 'move +col'"))
hl.bind(mainMod .. " + Left", hl.dsp.exec_cmd("hyprctl dispatch layoutmsg 'move -col'"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprctl dispatch layoutmsg promote"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprctl dispatch layoutmsg togglefit"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("hyprctl dispatch layoutmsg 'fit active'"))

hl.bind(mainMod .. " + ALT + Left", hl.dsp.exec_cmd("hyprctl dispatch layoutmsg 'swapcol l'"))
hl.bind(mainMod .. " + ALT + Right", hl.dsp.exec_cmd("hyprctl dispatch layoutmsg 'swapcol r'"))
hl.bind(mainMod .. " + ALT + Up", hl.dsp.exec_cmd("hyprctl dispatch swapwindow u"))
hl.bind(mainMod .. " + ALT + Down", hl.dsp.exec_cmd("hyprctl dispatch swapwindow d"))

-- NOTE: Removed the conflicting SHIFT + Right/Left layout overrides here to prevent overwriting your resize controls.

-----------------------
-- HARDWARE CONTROLS --
-----------------------
-- Audio controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true, locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true, locked = true })

-- Screen Brightness (Standard Keys)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { repeating = true, locked = true })

-- Hyprsunset Gamma (SHIFT + Brightness Keys)
hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprctl hyprsunset gamma +10"), { repeating = true, locked = true })
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("hyprctl hyprsunset gamma -10"), { repeating = true, locked = true })

-- Media Player Controls
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
