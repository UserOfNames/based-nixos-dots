{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        startup_mode = "Maximized";
        opacity = 0.95;
      };

      keyboard.bindings = [
      ];

      font = {
        normal = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Bold";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Bold Italic";
        };
        italic = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Italic";
        };
      };

      # Tokyoight-night by folke
      colors = {
        primary = {
          background = "#1a1b26";
          foreground = "#c0caf5";
        };

        cursor = {
          cursor = "#c0caf5";
          text = "#1a1b26";
        };

        # Normal colors
        normal = {
          black = "#15161e";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#bb9af7";
          cyan = "#7dcfff";
          white = "#a9b1d6";
        };

        # Bright colors
        bright = {
          black = "#414868";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#bb9af7";
          cyan = "#7dcfff";
          white = "#c0caf5";
        };

        transparent_background_colors = true;
      };

      # # Tomorrow night
      # colors = {
      #   primary = {
      #     background = "#1d1f21";
      #     foreground = "#c5c8c6";
      #   };
      #
      #   cursor = {
      #     text = "#1d1f21";
      #     cursor = "#ffffff";
      #   };
      #
      #   # Normal colors
      #   normal = {
      #     black   = "#1d1f21";
      #     red     = "#cc6666";
      #     green   = "#b5bd68";
      #     yellow  = "#e6c547";
      #     blue    = "#81a2be";
      #     magenta = "#b294bb";
      #     cyan    = "#70c0ba";
      #     white   = "#373b41";
      #   };
      #
      #   # Bright colors
      #   bright = {
      #     black   = "#666666";
      #     red     = "#ff3334";
      #     green   = "#9ec400";
      #     yellow  = "#f0c674";
      #     blue    = "#81a2be";
      #     magenta = "#b77ee0";
      #     cyan    = "#54ced6";
      #     white   = "#282a2e";
      #   };
      # };
    };
  };
}
