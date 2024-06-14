{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system.display;
in {
  imports = [
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
