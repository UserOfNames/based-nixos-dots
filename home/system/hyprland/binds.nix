{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    # l: Activate even while locked
    # r: Trigger on release
    # e: Repeat on hold
    # m: Mouse

    bind = [
      "SUPER SHIFT, M, exit,"
      "SUPER SHIFT, Q, killactive"
      "SUPER, F, fullscreen, 1"
      "SUPER SHIFT, F, fullscreen, 0"
      "SUPER, Y, togglefloating"
      "SUPER, O, exec, hyprctl setprop active opaque toggle"
      "SUPER, G, lockactivegroup, toggle"
      "SUPER SHIFT, G, togglegroup"
      "SUPER, bracketleft, changegroupactive, b"
      "SUPER, bracketright, changegroupactive, f"

      "SUPER, return, exec, $terminal"
      "SUPER, B, exec, $fileManager"
      "CTRL SHIFT, escape, exec, $terminal -e btop"
      "SUPER, E, exec, $editor"
      "SUPER, R, exec, $launcher"
      "SUPER SHIFT, V, exec, cliphist list | $dmenu | cliphist decode | wl-copy"
      "SUPER, W, exec, $browser"
      "SUPER CTRL SHIFT, L, exec, hyprlock"

      "SUPER SHIFT, S, toggleswallow"

      ", Print, exec, grim"
      "SUPER, Print, exec, grim -g \"$(slurp -w 0)\""

      "SUPER, H, movefocus, l"
      "SUPER, L, movefocus, r"
      "SUPER, J, movefocus, d"
      "SUPER, K, movefocus, u"

      "SUPER ALT, H, movewindow, l"
      "SUPER ALT, L, movewindow, r"
      "SUPER ALT, J, movewindow, d"
      "SUPER ALT, K, movewindow, u"

      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER, 6, workspace, 6"
      "SUPER, 7, workspace, 7"
      "SUPER, 8, workspace, 8"
      "SUPER, 9, workspace, 9"
      "SUPER, 0, workspace, 10"

      "SUPER SHIFT, 1, movetoworkspacesilent, 1"
      "SUPER SHIFT, 2, movetoworkspacesilent, 2"
      "SUPER SHIFT, 3, movetoworkspacesilent, 3"
      "SUPER SHIFT, 4, movetoworkspacesilent, 4"
      "SUPER SHIFT, 5, movetoworkspacesilent, 5"
      "SUPER SHIFT, 6, movetoworkspacesilent, 6"
      "SUPER SHIFT, 7, movetoworkspacesilent, 7"
      "SUPER SHIFT, 8, movetoworkspacesilent, 8"
      "SUPER SHIFT, 9, movetoworkspacesilent, 9"
      "SUPER SHIFT, 0, movetoworkspacesilent, 10"
    ];

    binde = [
      "SUPER SHIFT, H, resizeactive, -30 0"
      "SUPER SHIFT, L, resizeactive, 30 0"
      "SUPER SHIFT, J, resizeactive, 0 10"
      "SUPER SHIFT, K, resizeactive, 0 -10"

      "SUPER CTRL, H, moveactive, -20 0"
      "SUPER CTRL, L, moveactive, 20 0"
      "SUPER CTRL, J, moveactive, 0 20"
      "SUPER CTRL, K, moveactive, 0 -20"
    ];

    bindl = [
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioStop, exec, playerctl stop"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
    ];

    bindle = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ --limit 1.0"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%- --limit 1.0"

      "ALT, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 2%+ --limit 1.0"
      "ALT, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 2%- --limit 1.0"

      ", XF86MonBrightnessUp, exec, brightnessctl s +1%"
      ", XF86MonBrightnessDown, exec, brightnessctl s 1%-"

      "ALT, XF86MonBrightnessUp, exec, brightnessctl s +5%"
      "ALT, XF86MonBrightnessDown, exec, brightnessctl s 5%-"
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
