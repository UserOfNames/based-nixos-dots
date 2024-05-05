{config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    # l: Activate even while locked
    # r: Trigger on release
    # e: Repeat on hold
    # m: Mouse

    bind = [
      "$mainMod, return, exec, $terminal"
      "$mainMod SHIFT, M, exit,"
      "$mainMod, Q, killactive"
      "$mainMod, F, fullscreen, 1"
      "$mainMod SHIFT, F, fullscreen, 0"

      "$mainMod SHIFT, V, exec, cliphist list | fuzzel -d | cliphist decode | wl-copy"

      "$mainMod, W, exec, $browser"
      "$mainMod, R, exec, $menu"

      "$mainMod, h, movefocus, l"
      "$mainMod, l, movefocus, r"
      "$mainMod, j, movefocus, d"
      "$mainMod, k, movefocus, u"

      "$mainMod ALT, h, movewindow, l"
      "$mainMod ALT, l, movewindow, r"
      "$mainMod ALT, j, movewindow, d"
      "$mainMod ALT, k, movewindow, u"
    ];

    binde = [
      "$mainMod SHIFT, h, resizeactive, -30 0"
      "$mainMod SHIFT, l, resizeactive, 30 0"
      "$mainMod SHIFT, j, resizeactive, 0 10"
      "$mainMod SHIFT, k, resizeactive, 0 -10"
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

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
