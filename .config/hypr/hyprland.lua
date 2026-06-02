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
    hl.exec_cmd("waybar & awww-daemon & swaync") 
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
            inactive_border = "rgba(00000000)"
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "scrolling"
    },

    decoration = {
        rounding = 15,
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

    animations = {
        enabled = true,
        bezier = {
            linear = { 0, 0, 1, 1 },
            md3_standard = { 0.2, 0, 0, 1 },
            md3_decel = { 0.05, 0.7, 0.1, 1 },
            md3_accel = { 0.3, 0, 0.8, 0.15 },
            overshot = { 0.05, 0.9, 0.1, 1.1 },
            crazyshot = { 0.1, 1.5, 0.76, 0.92 },
            hyprnostretch = { 0.05, 0.9, 0.1, 1.0 },
            menu_decel = { 0.1, 1, 0, 1 },
            menu_accel = { 0.38, 0.04, 1, 0.07 },
            easeInOutCirc = { 0.85, 0, 0.15, 1 },
            easeOutCirc = { 0, 0.55, 0.45, 1 },
            easeOutExpo = { 0.16, 1, 0.3, 1 },
            softAcDecel = { 0.26, 0.26, 0.15, 1 },
            md2 = { 0.4, 0, 0.2, 1 }
        },
        animation = {
            windows = { 1, 5, "overshot", "popin 80%" },
            windowsIn = { 1, 5, "overshot", "popin 80%" },
            windowsOut = { 1, 5, "md3_accel", "popin 80%" },
            border = { 1, 10, "default" },
            fade = { 1, 3, "md3_decel" },
            workspaces = { 1, 4, "md3_decel", "slide" },
            specialWorkspace = { 1, 3, "md3_decel", "slidevert" }
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

})

-------------------------
---- PER-DEVICE RULES ---
-------------------------
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
