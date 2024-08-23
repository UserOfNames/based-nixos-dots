{ config, lib, myLib, ... }:

let
  cfg = config.myModules.system.display;
in {
  imports = [] ++ (myLib.importHelper ./.);
  #   ./hyprland.nix
  #   ./plasma.nix
  #   ./sddm.nix
  # ];

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
