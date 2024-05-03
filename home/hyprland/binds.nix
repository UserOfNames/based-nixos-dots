{config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    # l: Activate even while locked
    # e: Repeat on hold

    bind = [
      "$mainMod, return, exec, $terminal"
      "$mainMod SHIFT, M, exit,"
      "$mainMod, Q, killactive"
      "$mainMod, F, fullscreen, 1"
      "$mainMod SHIFT, F, fullscreen, 0"
      "$mainMod ALT, F, fakefullscreen"

      "$mainMod, W, exec, $browser"
      "$mainMod, R, exec, $menu"

      "$mainMod, h, movefocus, l"
      "$mainMod, l, movefocus, r"
      "$mainMod, k, movefocus, u"
      "$mainMod, j, movefocus, d"

      "$mainMod SHIFT, h, movewindow, l"
      "$mainMod SHIFT, l, movewindow, r"
      "$mainMod SHIFT, k, movewindow, u"
      "$mainMod SHIFT, j, movewindow, d"
    ];

    bindle = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 1.0"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- --limit 1.0"

      "ALT, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%+ --limit 1.0"
      "ALT, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%- --limit 1.0"
    ];

    bindl = [
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  };
}
