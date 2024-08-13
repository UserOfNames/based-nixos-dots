{ config, lib, ... }:

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
        enable_audio_bell = false;
      };
    };
  };
}
