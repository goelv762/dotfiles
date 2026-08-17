return {
  source = "~/.config/hypr/modules/variables.conf",

  -- Master toggle to disable all keybinds
  binds = {
    { mods = "$mainMod", key = "F11", dispatcher = "submap", args = "clean" },
  },

  submaps = {
    -- Submap for clean (disabled state)
    clean = {
      binds = {
        -- Keybind to return to the default submap (re-enable keybinds)
        { mods = "$mainMod SHIFT", key = "F11", dispatcher = "submap", args = "reset" },

        -- Fullscreen toggle (active in clean submap)
        { mods = "$mainMod", key = "I", dispatcher = "fullscreen", args = "" },
      },
    },

    -- Submap for reset (default keybinds enabled)
    reset = {
      binds = {
        { mods = "$mainMod", key = "RETURN", dispatcher = "exec", args = "$terminalBash" },
        { mods = "$mainMod SHIFT", key = "RETURN", dispatcher = "exec", args = "$terminalZsh" },
        { mods = "$mainMod", key = "D", dispatcher = "exec", args = "discord" },
        { mods = "$mainMod", key = "F", dispatcher = "exec", args = "firefox" },
        { mods = "$mainMod", key = "B", dispatcher = "exec", args = "blender" },
        { mods = "$mainMod", key = "C", dispatcher = "killactive", args = "" },
        { mods = "$mainMod", key = "M", dispatcher = "exit", args = "" }, -- REPLACEABLE
        { mods = "$mainMod", key = "G", dispatcher = "exec", args = "$fileManager" },
        { mods = "$mainMod", key = "U", dispatcher = "togglefloating", args = "" }, -- REPLACEABLE
        { mods = "$mainMod", key = "A", dispatcher = "exec", args = "$menu" },
        { mods = "$mainMod", key = "I", dispatcher = "fullscreen", args = "" },
        { mods = "$mainMod", key = "P", dispatcher = "pseudo", args = "" }, -- REPLACEABLE
        { mods = "$mainMod", key = "O", dispatcher = "layoutmsg", args = "togglesplit" },
        { mods = "$mainMod", key = "V", dispatcher = "exec", args = 'kitty --override font_size=7 --title info-btop bash -c "btop"' },
        { mods = "", key = "Print", dispatcher = "exec", args = 'grim -g "$(slurp)" - | wl-copy' },
        { mods = "$mainMod", key = "T", dispatcher = "exec", args = 'kitty bash -c "nvim ~/notes/todo.txt"' },
        { mods = "$mainMod SHIFT", key = "T", dispatcher = "exec", args = 'kitty bash -c "nvim ~/notes/journal.txt"' },
        { mods = "$mainMod", key = "Y", dispatcher = "exec", args = 'hyprctl keyword decoration:screen_shader "./misc/shader.glsl"' },
        { mods = "$mainMod SHIFT", key = "Y", dispatcher = "exec", args = 'hyprctl keyword decoration:screen_shader ""' },

        { mods = "$mainMod SHIFT", key = "M", dispatcher = "exec", args = "shutdown now" },
        { mods = "$mainMod SHIFT", key = "N", dispatcher = "exec", args = "reboot" },

        { mods = "$mainMod SHIFT", key = "z", dispatcher = "movecurrentworkspacetomonitor", args = "l" },
        { mods = "$mainMod SHIFT", key = "x", dispatcher = "movecurrentworkspacetomonitor", args = "r" },

        -- Move focus
        { mods = "$mainMod", key = "H", dispatcher = "movefocus", args = "l" },
        { mods = "$mainMod", key = "J", dispatcher = "movefocus", args = "d" },
        { mods = "$mainMod", key = "K", dispatcher = "movefocus", args = "u" },
        { mods = "$mainMod", key = "L", dispatcher = "movefocus", args = "r" },

        -- Move windows
        { mods = "$mainMod SHIFT", key = "H", dispatcher = "movewindow", args = "l" },
        { mods = "$mainMod SHIFT", key = "J", dispatcher = "movewindow", args = "d" },
        { mods = "$mainMod SHIFT", key = "K", dispatcher = "movewindow", args = "u" },
        { mods = "$mainMod SHIFT", key = "L", dispatcher = "movewindow", args = "r" },

        -- Resize windows
        { mods = "$mainMod CTRL", key = "H", dispatcher = "resizeactive", args = "-50 0" },
        { mods = "$mainMod CTRL", key = "J", dispatcher = "resizeactive", args = "0 50" },
        { mods = "$mainMod CTRL", key = "K", dispatcher = "resizeactive", args = "0 -50" },
        { mods = "$mainMod CTRL", key = "L", dispatcher = "resizeactive", args = "50 0" },

        { mods = "$mainMod", key = "Q", dispatcher = "workspace", args = "1" },
        { mods = "$mainMod", key = "W", dispatcher = "workspace", args = "2" },
        { mods = "$mainMod", key = "E", dispatcher = "workspace", args = "3" },
        { mods = "$mainMod", key = "R", dispatcher = "workspace", args = "4" },

        -- for "locking"
        -- { mods = "$mainMod SHIFT", key = "L", dispatcher = "workspace", args = "10" },

        { mods = "$mainMod SHIFT", key = "Q", dispatcher = "movetoworkspace", args = "1" },
        { mods = "$mainMod SHIFT", key = "W", dispatcher = "movetoworkspace", args = "2" },
        { mods = "$mainMod SHIFT", key = "E", dispatcher = "movetoworkspace", args = "3" },
        { mods = "$mainMod SHIFT", key = "R", dispatcher = "movetoworkspace", args = "4" },
      },

      bindm = {
        { mods = "$mainMod", button = "mouse:272", dispatcher = "movewindow" },
        { mods = "$mainMod", button = "mouse:273", dispatcher = "resizewindow" },
      },
    },
  },
}
