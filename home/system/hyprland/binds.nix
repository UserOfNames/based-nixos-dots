{ config, pkgs, ... }:

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
      "$mainMod CTRL, F, fullscreen, 0"
      "$mainMod, Y, togglefloating"
      "$mainMod, O, toggleopaque"
      "$mainMod, G, lockactivegroup, toggle"
      "$mainMod SHIFT, G, togglegroup"
      "$mainMod, bracketleft, changegroupactive, b"
      "$mainMod, bracketright, changegroupactive, f"

      "$mainMod, R, exec, $menu"
      "$mainMod SHIFT, V, exec, cliphist list | fuzzel -d | cliphist decode | wl-copy"

      "$mainMod, W, exec, $browser"
      "$mainMod, B, exec, $terminal -e $fileManager"
      "CTRL SHIFT, L, exec, hyprlock"
      "CTRL SHIFT, escape, exec, $terminal -e btop"

      "$mainMod, H, movefocus, l"
      "$mainMod, L, movefocus, r"
      "$mainMod, J, movefocus, d"
      "$mainMod, K, movefocus, u"

      "$mainMod ALT, H, movewindow, l"
      "$mainMod ALT, L, movewindow, r"
      "$mainMod ALT, J, movewindow, d"
      "$mainMod ALT, K, movewindow, u"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"
    ];

    binde = [
      "$mainMod SHIFT, H, resizeactive, -30 0"
      "$mainMod SHIFT, L, resizeactive, 30 0"
      "$mainMod SHIFT, J, resizeactive, 0 10"
      "$mainMod SHIFT, K, resizeactive, 0 -10"

      "$mainMod CTRL, H, moveactive, -20 0"
      "$mainMod CTRL, L, moveactive, 20 0"
      "$mainMod CTRL, J, moveactive, 0 20"
      "$mainMod CTRL, K, moveactive, 0 -20"
    ];

    bindl = [
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
    ];

    bindle = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 1.0"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- --limit 1.0"

      "ALT, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%+ --limit 1.0"
      "ALT, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%- --limit 1.0"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
