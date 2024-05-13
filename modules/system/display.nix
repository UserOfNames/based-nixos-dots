{ config, pkgs, inputs, lib, ... }:

{
  options = {
    myModules.display.enable = lib.mkEnableOption "Enable display module";
  };

  config = lib.mkIf config.myModules.display.enable {
    # Wayland with xwayland, hyprland
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

    programs = {
      hyprland = {
        enable = true;
        xwayland.enable = true;
      };

      waybar.enable = true;
    };
  };
}
