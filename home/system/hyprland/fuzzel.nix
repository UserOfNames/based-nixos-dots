{ config, lib, ... }:

let
  cfg = config.myHomeModules.system.hyprland;
in {
  config = lib.mkIf cfg.enable {
    programs.fuzzel = {
      enable = true;

      settings = {
        main = {
          icons-enabled = "yes";
          icon-theme = config.gtk.iconTheme.name or "hicolor";
        };
      };
    };
  };
}
