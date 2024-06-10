{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.kitty;
in {
  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      shellIntegration.mode = "no-cursor";

      font = {
        name = "JetBrainsMono Nerd Font Mono";
        size = 12;
      };

      settings = {
        cursor_shape = "block";
        cursor_blink_interval = 0;
        confirm_os_window_close = 0;

        # Tokyonight-nvim kitty theme
        background = "#1a1b26";
        foreground = "#c0caf5";
        selection_background = "#283457";
        selection_foreground = "#c0caf5";
        url_color = "#73daca";
        cursor = "#c0caf5";
        cursor_text_color = "#1a1b26";

        # Tabs
        active_tab_background = "#7aa2f7";
        active_tab_foreground = "#16161e";
        inactive_tab_background = "#292e42";
        inactive_tab_foreground = "#545c7e";
        # tab_bar_background = "#15161e";

        # Windows
        active_border_color = "#7aa2f7";
        inactive_border_color = "#292e42";

        # normal
        color0 = "#15161e";
        color1 = "#f7768e";
        color2 = "#9ece6a";
        color3 = "#e0af68";
        color4 = "#7aa2f7";
        color5 = "#bb9af7";
        color6 = "#7dcfff";
        color7 = "#a9b1d6";

        # bright
        color8 = "#414868";
        color9 = "#f7768e";
        color10 = "#9ece6a";
        color11 = "#e0af68";
        color12 = "#7aa2f7";
        color13 = "#bb9af7";
        color14 = "#7dcfff";
        color15 = "#c0caf5";

        # extended colors
        color16 = "#ff9e64";
        color17 = "#db4b4b";
      };
    };
  };
}
