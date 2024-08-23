{ config, lib, ... }:

let
  cfg = config.myModules.system.display.sddm;
in {
  config = lib.mkIf cfg.enable {
    services.displayManager.sddm = {
      enable = true;
      # wayland.enable = true;
    };
  };
}
