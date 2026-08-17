return {
  monitor = {
    { "eDP-1", "1920x1200", "1920x0", "1" },
    { "DP-2", "1920x1080@60", "0x0", "1" },
    -- { "HDMI-A-1", "1920x1080@144", "0x0", "1" },
  },

  workspace = {
    { "1", "monitor:DP-2" },
    { "2", "monitor:DP-2" },
    { "3", "monitor:DP-2" },
    { "4", "monitor:DP-2" },

    -- { "1", "monitor:HDMI-A-1" },
    -- { "2", "monitor:HDMI-A-1" },
    -- { "3", "monitor:HDMI-A-1" },
    -- { "4", "monitor:HDMI-A-1" },
    { "5", "monitor:eDP-1" },
  },

  env = {
    { "XCURSOR_SIZE", "2" },
    { "HYPRCURSOR_SIZE", "2" },
    { "XDG_CURRENT_DESKTOP", "Hyprland" },
  },

  variables = {
    terminalBash = "kitty -e bash",
    terminalZsh = "kitty -e zsh",
    fileManager = "dolphin",
    menu = "tofi-run | xargs -r sh -c ",
    mainMod = "ALT",
  },
}
