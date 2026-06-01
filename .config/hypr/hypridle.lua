general {
    lock_cmd = pidof hyprlock || hyprlock
    before_sleep_cmd = loginctl lock-session
    after_sleep_cmd = hyprctl dispatch 'hl.dsp.dpms({ action = "enable" })' # handles the post-sleep display state
}

listener {
    timeout = 900               
    on-timeout = brightnessctl -s set 500    # dim screen
    on-resume = brightnessctl -r             # restore brightness
}

listener {
    timeout = 1200                                        
    on-timeout = loginctl lock-session      # lock screen
}

listener {
    timeout = 1500
    on-timeout = hyprctl dispatch 'hl.dsp.dpms({ action = "disable" })'  # screen off
    on-resume = hyprctl dispatch 'hl.dsp.dpms({ action = "enable" })'    # screen on
}

listener {
    timeout = 1800                                     
    on-timeout = systemctl suspend          # suspend system
}
