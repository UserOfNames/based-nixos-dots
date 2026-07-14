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

      settings = with myLib.catppuccinMocha; {
        cursor_shape = "block";
        cursor_blink_interval = 0;
        confirm_os_window_close = 0;
        enable_audio_bell = false;

        background = "#${base}";
        foreground = "#${text}";
        selection_background = "#${rosewater}";
        selection_foreground = "#${base}";
        url_color = "#${rosewater}";
        cursor = "#${rosewater}";
        cursor_text_color = "#${base}";

        # Tabs
        active_tab_background = "#${mauve}";
        active_tab_foreground = "#${crust}";
        inactive_tab_background = "#${mantle}";
        inactive_tab_foreground = "#${text}";
        tab_bar_background = "#${crust}";

        # Scrollbar
        scrollbar_handle_color = "#${overlay2}";
        scrollbar_track_color = "#${surface1}";

        # Windows
        active_border_color = "#${lavender}";
        inactive_border_color = "#${overlay0}";
        bell_border_color = "#${yellow}";

        wayland_titlebar_color = "system";

        # Marks
        mark1_background = "#${lavender}";
        mark1_foreground = "#${base}";
        mark2_background = "#${mauve}";
        mark2_foreground = "#${base}";
        mark3_background = "#${sapphire}";
        mark3_foreground = "#${base}";

        # normal
        color0 = "#${surface1}";
        color1 = "#${red}";
        color2 = "#${green}";
        color3 = "#${yellow}";
        color4 = "#${blue}";
        color5 = "#${pink}";
        color6 = "#${teal}";
        color7 = "#${subtext1}";

        # bright
        color8 = "#${surface2}";
        color9 = "#${red}";
        color10 = "#${green}";
        color11 = "#${yellow}";
        color12 = "#${blue}";
        color13 = "#${pink}";
        color14 = "#${teal}";
        color15 = "#${subtext0}";

        # extended colors
        color16 = "#${peach}";
        color17 = "#${flamingo}";
        color18 = "#${mantle}";
        color19 = "#${surface0}";
        color20 = "#${surface2}";
        color21 = "#${rosewater}";
      };
    };
  };
}
