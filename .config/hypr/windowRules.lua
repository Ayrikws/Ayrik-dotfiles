-- Window Rules
hl.window_rule({ match = { class = "vlc" }, opaque = true })
hl.window_rule({ match = { class = "jetbrains-studio|jetbrains-idea-ce|jetbrains-rustrover" }, opaque = true })
hl.window_rule({ match = { class = "^(firefox)$" }, rounding = 3 })
hl.window_rule({ match = { class = "^(vesktop)$" }, workspace = "3 silent" })
hl.window_rule({ match = { class = "^(io.github.kukuruzka165.materialgram|zapzap)$" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "^(com.github.neithern.g4music|org.qbittorrent.qBittorrent)$" }, float = true })
hl.window_rule({ match = { class = "^(ball-game|desert-rain)" }, float = true, fullscreen = true })
hl.window_rule({ match = { class = "^(it.mijorus.smile)$" }, float = true })
hl.window_rule({ match = { class = "^(steam)$" }, float = true, opacity = 0.80 })
hl.window_rule({ match = { class = "^(xdg-desktop-portal-gtk)$" }, float = true })
hl.window_rule({ match = { title = "^(.*Network Manager.*)$" }, float = true })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true, size = { 855, 525 }, center = true })
hl.window_rule({ match = { class = "^(pinentry-)" }, stay_focused = true })
hl.window_rule({ match = { class = "^(thunar)$", title = "rename" }, float = true })

-- Opacity rules
hl.window_rule({ match = { class = "^(thunar)$" }, opacity = 0.85 })
hl.window_rule({ match = { class = "^(discord|Vesktop|vesktop)$" }, opacity = 0.85 })
hl.window_rule({ match = { class = "^(v2rayN)$" }, opacity = 0.9 })
hl.window_rule({ match = { class = "^(ONLYOFFICE)$" }, opacity = 0.90 })
hl.window_rule({ match = { class = "^(org.telegram.desktop)$" }, opacity = 0.80 })
hl.window_rule({ match = { class = "^(soffice|libreoffice-writer|org.libreoffice.LibreOffice)$" }, opacity = 0.90 })
hl.window_rule({ match = { class = "^(Motrix)$" }, opacity = 0.80 })

-- Picture-in-Picture special treatment
hl.window_rule({
  match = { title = "^(Picture-in-Picture)" },
  float = true,
  size = { 585, 330 },
  move = { "100%-816", "50" }, -- Fixed: Split into a Lua coordinate table
  pin = true,
  opacity = "1.0 0.8 override",
  no_initial_focus = true
})

-- Layer Rules
hl.layer_rule({ match = { namespace = "^(waybar)$" }, blur = true })
hl.layer_rule({ match = { namespace = "^(logout_dialog)$" }, blur = true })

hl.layer_rule({
  match = { namespace = "^(wofi)$" },
  blur = true,
  ignore_alpha = 0.14
})

hl.layer_rule({
  match = { namespace = "^(swaync-control-center)$" },
  blur = true,
  ignore_alpha = 0.1
})

hl.layer_rule({
  match = { namespace = "^(swaync-notification-window)$" },
  blur = true,
  ignore_alpha = 0.1
})
