{ config, lib, ... }:

let
  cfg = config.myModules.system.display;
in {
  imports = [
    # FIXME Using importHelper here throws some error
    ./hyprland.nix
    ./plasma.nix
    ./sddm.nix
  ];

  config = lib.mkIf cfg.enable {
    programs.xwayland.enable = true;
    services = {
      xserver = {
        enable = true;
        xkb = {
          layout = "us";
        };
      };
    };
  };
}
