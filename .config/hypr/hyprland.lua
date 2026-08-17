-- ============================================================
-- Combined Hyprland config (Lua)
-- Ported 1:1 from: hyprland.conf + modules/{variables,start,input,layout,workspace,keybinds}.conf
-- Target: Hyprland >= 0.55 lua config (tested against 0.56.2 API)
-- ============================================================

-- ---------------------------------------------
-- variables.conf  (was: $var = ...)
-- ---------------------------------------------
local terminalBash = "kitty -e bash"
local terminalZsh   = "kitty -e zsh"
local fileManager    = "dolphin"
local menu            = "tofi-run | xargs -r sh -c "
local mainMod          = "ALT"

-- ---------------------------------------------
-- monitors (was: monitor = ...)
-- ---------------------------------------------
hl.monitor({ output = "eDP-1", mode = "1920x1200",    position = "1920x0", scale = 1 })
hl.monitor({ output = "DP-2",  mode = "1920x1080@60", position = "0x0",    scale = 1 })
-- hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@144", position = "0x0", scale = 1 })

-- ---------------------------------------------
-- workspace -> monitor assignments (was: workspace = N, monitor:X)
-- ---------------------------------------------
hl.workspace_rule({ workspace = "1", monitor = "DP-2" })
hl.workspace_rule({ workspace = "2", monitor = "DP-2" })
hl.workspace_rule({ workspace = "3", monitor = "DP-2" })
hl.workspace_rule({ workspace = "4", monitor = "DP-2" })

-- hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1" })
-- hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1" })
-- hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-1" })
-- hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1" })

-- ---------------------------------------------
-- environment variables (was: env = ...)
-- ---------------------------------------------
hl.env("XCURSOR_SIZE", "2")
hl.env("HYPRCURSOR_SIZE", "2")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

-- ---------------------------------------------
-- start.conf  (was: exec-once = ...)
-- exec-once has no direct keyword in lua; hook the session-start event instead.
-- This still only fires once per session, not on every config reload.
-- ---------------------------------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("waybar")
end)

-- ---------------------------------------------
-- input.conf
-- ---------------------------------------------
hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "caps:swapescape",
        kb_rules   = "",

        follow_mouse   = 1,
        accel_profile  = "flat",

        sensitivity = -0.3, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
            scroll_factor  = 0.2,
        },
    },

    cursor = {
        inactive_timeout = 1,
    },
})

-- ---------------------------------------------
-- layout.conf
-- ---------------------------------------------
hl.config({
    general = {
        gaps_in  = 0,
        gaps_out = 0,

        border_size = 2,

        col = {
            active_border   = "rgba(8c8c8caa)",
            inactive_border = "rgba(595959aa)",
        },

        layout = "dwindle",
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    animations = {
        enabled = true,
    },

    misc = {
        disable_splash_rendering = true,
        disable_hyprland_logo    = true,
    },
})

hl.animation({ leaf = "windows",    enabled = true, speed = 1.1, bezier = "default", style = "popin 0%" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2,   bezier = "default", style = "slide 0%" })

-- ---------------------------------------------
-- workspace.conf  (was: windowrule { ... })
-- ---------------------------------------------
hl.window_rule({
    name = "suppress",
    match = { class = ".*" },

    suppress_event = "maximize",
})

-- game engine stuff
hl.window_rule({
    name = "float-dev",
    match = { title = "^(opengl game|python|sim)$" },
    float = true,
})

hl.window_rule({
    name = "info-btop",
    match = { class = "^(kitty)$", title = "^(info-btop)$" },

    size          = "800 400",
    stay_focused  = true,
    float         = true,
})

-- ---------------------------------------------
-- keybinds.conf
-- ---------------------------------------------

-- Master toggle to disable all keybinds
hl.bind(mainMod .. " + F11", hl.dsp.submap("clean"))

-- Submap for clean (disabled state)
hl.define_submap("clean", function()
    -- Keybind to return to the default submap (re-enable keybinds)
    hl.bind(mainMod .. " + SHIFT + F11", hl.dsp.submap("default"))

    -- Fullscreen toggle (active in clean submap)
    hl.bind(mainMod .. " + I", hl.dsp.window.fullscreen({ action = "toggle" }))
end)

-- Default submap (was: submap = reset) -- everything below is active normally

hl.bind(mainMod .. " + RETURN",       hl.dsp.exec_cmd(terminalBash))
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(terminalZsh))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("discord"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("blender"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit()) -- REPLACEABLE
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + U", hl.dsp.window.float({ action = "toggle" })) -- REPLACEABLE
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + I", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd('kitty --override font_size=7 --title info-btop bash -c "btop"'))
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
hl.bind(mainMod .. " + T",       hl.dsp.exec_cmd('kitty bash -c "nvim ~/notes/todo.txt"'))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd('kitty bash -c "nvim ~/notes/journal.txt"'))
hl.bind(mainMod .. " + Y",       hl.dsp.exec_cmd('hyprctl keyword decoration:screen_shader "./misc/shader.glsl"'))
hl.bind(mainMod .. " + SHIFT + Y", hl.dsp.exec_cmd('hyprctl keyword decoration:screen_shader ""'))

hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("shutdown now"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("reboot"))

hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.workspace.move({ monitor = "-" }))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.workspace.move({ monitor = "+" }))

-- Move focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Move windows
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

-- Resize windows
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.resize({ x = -50, y = 0 }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.resize({ x = 0,   y = 50 }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.resize({ x = 0,   y = -50 }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.resize({ x = 50,  y = 0 }))

hl.bind(mainMod .. " + Q", hl.dsp.focus({ workspace = "1" }))
hl.bind(mainMod .. " + W", hl.dsp.focus({ workspace = "2" }))
hl.bind(mainMod .. " + E", hl.dsp.focus({ workspace = "3" }))
hl.bind(mainMod .. " + R", hl.dsp.focus({ workspace = "4" }))
-- for "locking"
-- hl.bind(mainMod .. " + SHIFT + L", hl.dsp.focus({ workspace = "10" }))

hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.move({ workspace = "1" }))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.move({ workspace = "2" }))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.window.move({ workspace = "3" }))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.window.move({ workspace = "4" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
