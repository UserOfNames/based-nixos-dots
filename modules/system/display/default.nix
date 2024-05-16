{ config, pkgs, lib, ... }:

{
  imports = [ ./hyprland.nix ];

  options = {
    myModules.display.enable = lib.mkEnableOption "Enable basic display options";
  };

  config = lib.mkIf config.myModules.display.enable {
    programs.xwayland.enable = true;
    services = {
      displayManager = {
        sddm = {
          enable = true;
          wayland.enable = true;
        };
      };

      xserver = {
        enable = true;
        xkb = {
          layout = "us";
        };
      };
    };
  };
}
