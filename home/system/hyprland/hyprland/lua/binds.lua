local const = require('constants')

hl.bind("SUPER + SHIFT + M", hl.dsp.exit({}))

hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close({}))

hl.bind("SUPER + F", hl.dsp.window.fullscreen({
   mode = "maximized",
   action = "toggle",
}))

hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({
   mode = "fullscreen",
   action = "toggle",
}))

hl.bind("SUPER + Y", hl.dsp.window.float({
   action = "toggle",
}))

hl.bind("SUPER + O", hl.dsp.window.set_prop({
   prop = "opaque",
   value = "toggle",
   window = "active",
}))

hl.bind("SUPER + G", hl.dsp.group.lock_active({
   action = "toggle",
}))

hl.bind("SUPER + SHIFT + G", hl.dsp.group.toggle({}))

hl.bind("SUPER + bracketleft", hl.dsp.group.prev({}))

hl.bind("SUPER + bracketright", hl.dsp.group.next({}))

hl.bind("SUPER + return", hl.dsp.exec_cmd(const.terminal))
hl.bind("SUPER + B", hl.dsp.exec_cmd(const.file_manager))
hl.bind("CTRL + SHIFT + escape", hl.dsp.exec_cmd(const.task_manager))
hl.bind("SUPER + E", hl.dsp.exec_cmd(const.editor))
hl.bind("SUPER + R", hl.dsp.exec_cmd(const.launcher))
hl.bind("SUPER + SHIFT + V", hl.dsp.exec_cmd(
   "cliphist list | " .. const.dmenu .. " cliphistdecode | wl-copy"
))
hl.bind("SUPER + W", hl.dsp.exec_cmd(const.browser))
hl.bind("SUPER + CTRL + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind("SUPER + SHIFT + S", hl.dsp.window.toggle_swallow())

hl.bind("print", hl.dsp.exec_cmd("grim"))
hl.bind("SUPER + print", hl.dsp.exec_cmd("grim -g \"$(slurp -w 0)\""))

hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }))

hl.bind("SUPER + ALT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + ALT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + ALT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + ALT + K", hl.dsp.window.move({ direction = "u" }))

for i = 1, 9 do
   hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i, }))
end

for i = 1, 9 do
   hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({
      workspace = i,
      follow = false,
   }))
end

local repeating = { repeating = true }

hl.bind("SUPER + SHIFT + H", hl.dsp.window.resize({
   x = -30, y = 0, relative = true,
}), repeating)

hl.bind("SUPER + SHIFT + L", hl.dsp.window.resize({
   x = 30, y = 0, relative = true,
}), repeating)

hl.bind("SUPER + SHIFT + J", hl.dsp.window.resize({
   x = 0, y = 10, relative = true,
}), repeating)

hl.bind("SUPER + SHIFT + K", hl.dsp.window.resize({
   x = 0, y = 10, relative = true,
}), repeating)

hl.bind("SUPER + CTRL + H", hl.dsp.window.move({
   x = -20, y = 0, relative = true,
}), repeating)

hl.bind("SUPER + CTRL + L", hl.dsp.window.move({
   x = 20, y = 0, relative = true,
}), repeating)

hl.bind("SUPER + CTRL + J", hl.dsp.window.move({
   x = 0, y = 20, relative = true,
}), repeating)

hl.bind("SUPER + CTRL + K", hl.dsp.window.move({
   x = 0, y = -20, relative = true,
}), repeating)

local locked = { locked = true }

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), locked)

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), locked)

hl.bind("ALT + XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), locked)

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), locked)

hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"), locked)

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), locked)

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), locked)

local locked_repeating = { locked = true, repeating = true }

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ --limit 1.0"),
   locked_repeating)

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%- --limit 1.0"),
   locked_repeating)

hl.bind("ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 2%+ --limit 1.0"),
   locked_repeating)

hl.bind("ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 2%- --limit 1.0"),
   locked_repeating)

hl.bind(" + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +1%"), locked_repeating)

hl.bind(" + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 1%-"), locked_repeating)

hl.bind("ALT + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), locked_repeating)

hl.bind("ALT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), locked_repeating)

local mouse = { mouse = true }

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), mouse)

hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), mouse)
