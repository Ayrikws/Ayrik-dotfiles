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
local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "rofi -show"

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("qs")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("swaync")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 22")
    hl.exec_cmd("udiskie")
    hl.exec_cmd("hypridle")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", 22)
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
        gaps_in = 8,
        gaps_out = 20,

        border_size = 1,

        col = {
            active_border   = "rgb(EBDBB2)",
            inactive_border = "rgba(00000000)",
	},

        resize_on_border = true,
        allow_tearing 	 = false,
        layout 			 = "scrolling"
    },

    decoration = {
        rounding 	   	 = 15,
        active_opacity 	 = 1.0,
        inactive_opacity = 0.9,

        shadow = {
            enabled 	 = true,
            range 		 = 4,
            render_power = 3,
            color 		 = "rgba(0a0a0a89)",

        },

        blur = {
            enabled = true,
            size 	= 5,
            passes 	= 2,

            new_optimizations = true,
            ignore_opacity 	  = true,
            xray 			  = false,

            contrast   = 0.9,
            brightness = 0.8,
            vibrancy   = 0.18
        }
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = false
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

-------------------------
---- PER-DEVICE RULES ---
-------------------------
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5
})

--------------------
----  MODULES   ----
--------------------
require("keybindings")
require("windowRules")
require("workspaceRules")
