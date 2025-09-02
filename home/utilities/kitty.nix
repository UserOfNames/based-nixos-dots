{ pkgs, config, lib, myLib, ... }:

let
  cfg = config.myHomeModules.utilities.kitty;
in {
  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      shellIntegration.mode = "no-cursor";

      font = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
        size = 12;
      };

      settings = with myLib.base16Scheme; {
        cursor_shape = "block";
        cursor_blink_interval = 0;
        confirm_os_window_close = 0;
        enable_audio_bell = false;

        background = "#${base00}";
        foreground = "#${base05}";
        selection_background = "#${base03}";
        selection_foreground = "#${base05}";
        url_color = "#${base04}";
        cursor = "#${base05}";
        cursor_text_color = "#${base00}";

        # Tabs
        active_tab_background = "#${base00}";
        active_tab_foreground = "#${base05}";
        inactive_tab_background = "#${base01}";
        inactive_tab_foreground = "#${base04}";
        tab_bar_background = "#${base01}";

        # Windows
        active_border_color = "#${base03}";
        inactive_border_color = "#${base01}";

        # normal
        color0 = "#${base00}";
        color1 = "#${base08}";
        color2 = "#${base0B}";
        color3 = "#${base04}";
        color4 = "#${base0D}";
        color5 = "#${base0E}";
        color6 = "#${base0C}";
        color7 = "#${base05}";

        # bright
        color8 = "#${base02}";
        color9 = "#${base08}";
        color10 = "#${base0B}";
        color11 = "#${base04}";
        color12 = "#${base0D}";
        color13 = "#${base0E}";
        color14 = "#${base0C}";
        color15 = "#${base07}";

        # extended colors
        color16 = "#${base09}";
        color17 = "#${base0E}";
        color18 = "#${base01}";
        color19 = "#${base02}";
        color20 = "#${base04}";
        color21 = "#${base06}";
      };
    };
  };
}
