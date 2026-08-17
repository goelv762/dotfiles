return {
  windowrule = {
    {
      name = "suppress",
      ["match:class"] = ".*",

      suppress_event = "maximize",
    },

    -- game engine stuff
    {
      name = "float-dev",
      ["match:title"] = "^(opengl game|python|sim)$",
      float = true,
    },

    {
      name = "info-btop",
      ["match:class"] = "^(kitty)$",
      ["match:title"] = "^(info-btop)$",

      size = "800 400",
      stay_focused = "on",
      float = true,
    },
  },
}
