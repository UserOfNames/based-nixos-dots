{ config, pkgs, lib, ... }:

let cfg = config.myHomeModules.system.cursor; in {
  options.myHomeModules.system.cursor = {
    enable = lib.mkEnableOption "Enable cursor home configuration";
  };

  config = lib.mkIf cfg.enable {
    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
      size = 16;
    };
  };
}
