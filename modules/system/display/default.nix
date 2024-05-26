{ config, pkgs, lib, ... }:

{
  imports = [
    ./hyprland.nix
    ./plasma.nix
    ./sddm.nix
  ];

  options = {
    myModules.system.display.enable = lib.mkEnableOption "Enable basic display options";
  };

  config = lib.mkIf config.myModules.system.display.enable {
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
