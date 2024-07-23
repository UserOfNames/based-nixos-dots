{ config, pkgs, ... }:

{
  myModules = {
    system = {
      enable = true;
      user.userName = "zdbg";
      hardware = {
        bluetooth.enable = true;
      };
      display = {
        hyprland.enable = false;
        plasma.enable = true;
      };
    };

    other = {
      enable = true;
    };

    utilities = {
      enable = true;
      virtualization.enable = true;
    };
  };

  myHomeModules = {
    other = {
      enable = true;
    };

    productivity = {
      enable = true;
    };

    system = {
      enable = true;
    };

    utilities = {
      enable = true;
      syncthing.enable = true;
    };
  };
}
