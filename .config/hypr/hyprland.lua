------------------
---- MONITORS ----
------------------
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1
})

---------------------
---- MY PROGRAMS ----
---------------------
local terminal = "kitty"
local fileManager = "thunar"
local menu = "rofi -show"

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & swww-daemon & swaync")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 22")
    hl.exec_cmd("udiskie")
    hl.exec_cmd("hypridle")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "22")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

---------------------
---- PERMISSIONS ----
---------------------
-- -- Ecosystem permissions are set using strings or tables if needed:
-- hl.config({ ecosystem = { enforce_permissions = 1 } })
-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 5,
        border_size = 2,
        col = {
            active_border = "rgb(EBDBB2)",
            inactive_border = "rgba(50382dff)"
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "scrolling"
    },

    decoration = {
        rounding = 15,
        rounding_power = 2.0,
        active_opacity = 1.0,
        inactive_opacity = 0.85,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)"
        },
        blur = {
            enabled = true,
            size = 5,
            passes = 2,
            new_optimizations = true,
            ignore_opacity = true,
            xray = false,
            contrast = 0.9,
            brightness = 0.8,
            vibrancy = 0.18
        }
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = false
    },

    input = {
        kb_layout = "us,ir",
        kb_options = "grp:alt_shift_toggle",
        follow_mouse = 1,
        force_no_accel = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false
        }
    },

    scrolling = {
        column_width = 0.65,
        fullscreen_on_one_column = true
    }
})

--------------------
---- ANIMATIONS ----
--------------------
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("md3_standard", { type = "bezier", points = { {0.2, 0}, {0, 1} } })
hl.curve("md3_decel", { type = "bezier", points = { {0.05, 0.7}, {0.1, 1} } })
hl.curve("md3_accel", { type = "bezier", points = { {0.3, 0}, {0.8, 0.15} } })
hl.curve("overshot", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.1} } })
hl.curve("crazyshot", { type = "bezier", points = { {0.1, 1.5}, {0.76, 0.92} } })
hl.curve("hyprnostretch", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.0} } })
hl.curve("menu_decel", { type = "bezier", points = { {0.1, 1}, {0, 1} } })
hl.curve("menu_accel", { type = "bezier", points = { {0.38, 0.04}, {1, 0.07} } })
hl.curve("easeInOutCirc", { type = "bezier", points = { {0.85, 0}, {0.15, 1} } })
hl.curve("easeOutCirc", { type = "bezier", points = { {0, 0.55}, {0.45, 1} } })
hl.curve("easeOutExpo", { type = "bezier", points = { {0.16, 1}, {0.3, 1} } })
hl.curve("softAcDecel", { type = "bezier", points = { {0.26, 0.26}, {0.15, 1} } })
hl.curve("md2", { type = "bezier", points = { {0.4, 0}, {0.2, 1} } })

hl.animation({ leaf = "global", enabled = true })
hl.animation({ leaf = "windows", enabled = true, speed = 5, curve = "overshot", style = "popin 80%" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 5, curve = "overshot", style = "popin 80%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, curve = "md3_accel", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, curve = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, curve = "md3_decel" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, curve = "md3_decel", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, curve = "md3_decel", style = "slidevert" })

-----------------
---- DEVICES ----
-----------------
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5
})

-------------------------
---- SOURCED MODULES ----
-------------------------
require("keybindings")
require("workspaceRules")
require("windowRules")
