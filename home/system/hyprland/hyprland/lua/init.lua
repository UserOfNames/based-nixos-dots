-- Host-specific information, such as paths, certain hardware toggles,
-- monitor layouts, etc.
local host = require('hyprland.host_vars')

local const = require('hyprland.constants')

local colors = require('hyprland.catppuccin-mocha')

require('hyprland.binds')

-- TODO: Silence "undefined global" whining
hl.on("hyprland.start", function()
   hl.exec_cmd("awww-daemon")
   hl.exec_cmd(host.awww_random_path .. "bin/awww-random " .. host.wallpapers_path)
   hl.exec_cmd("hypridle")
   hl.exec_cmd("mako")
   hl.exec_cmd(host.nw_applet_path .. "bin/nm-applet")
end)

hl.config({
   general = {
      border_size = 2,
      gaps_in = 5,
      gaps_out = 10,

      col = {
         active_border = colors.mauve,
      },

      layout = "master",
   },

   decoration = {
      rounding = 5,

      blur = {
         enabled = false,
      }
   },

   input = {
      kb_options = "caps:escape",
      numlock_by_default = host.numlock_by_default,
      repeat_rate = 40,
      repeat_delay = 300,
      follow_mouse = 2,
      float_switch_override_focus = 0,
   },

   misc = {
      disable_hyprland_logo = true,
      force_default_wallpaper = false,
      enable_swallow = true,
      swallow_regex = "^(" .. const.terminal .. ")$",
   },

   cursor = {
      no_warps = true,
   },

   master = {
      new_status = "slave",
   },
})

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "fade", enabled = false })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "default", style = "fade" })
hl.animation({ leaf = "monitorAdded", enabled = 0 })

hl.window_rule({
   match = {
      class = "kitty",
   },

   opacity = "0.95 override 0.85 override 1.0 override",
})

hl.window_rule({
   match = {
      class = "stash-tui",
   },

   float = true,
   center = true,
   pin = true,
   opaque = true,
   no_anim = true,
   size = { "(monitor_w * 0.5)", "(monitor_h * 0.5)" },
})

hl.layer_rule({
   match = {
      namespace = "^(menu)$",
   },

   no_anim = true,
})
