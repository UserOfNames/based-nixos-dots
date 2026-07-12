-- Host-specific information, such as paths, certain hardware toggles,
-- monitor layouts, etc.
local nix = require('hyprland.host_vars')

require('hyprland.binds')

-- TODO: Silence "undefined global" whining
hl.on("hyprland.start", function()
   hl.exec_cmd("awww-daemon")
   hl.exec_cmd(nix.awww_random_path .. "bin/awww-random " .. nix.wallpapers_path)
   hl.exec_cmd("hypridle")
   hl.exec_cmd("mako")
   hl.exec_cmd(nix.nw_applet_path .. "bin/nm-applet")
   hl.exec_cmd("wl-paste --type text --watch cliphist store")
   hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

hl.config({
   general = {
      border_size = 2,
      gaps_in = 5,
      gaps_out = 10,

      col = {
         active_border = "rgb(7aa2f7)",
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
      numlock_by_default = nix.numlock_by_default,
      repeat_rate = 40,
      repeat_delay = 300,
      follow_mouse = 2,
   },

   misc = {
      disable_hyprland_logo = true,
      force_default_wallpaper = false,
      disable_autoreload = true,
      -- TODO: Consider window swallowing
      enable_swallow = true,
      swallow_regex = "^(kitty)$",
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

hl.layer_rule({
   match = {
      namespace = "^(menu)$",
   },

   no_anim = true,
})
