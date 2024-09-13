{ config, pkgs, ... }:

let
  userName = config.myModules.system.mainUser.userName;
in {
  imports = [
    ../../home
  ];

  wayland.windowManager.hyprland.settings.input."numlock_by_default" = false;

  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    stateVersion = "23.11"; # stateVersion should match the NixOS stateVersion and should not be changed!

    packages = with pkgs; [
      qbittorrent
    ];
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
      hyprland.enable = true;
    };

    utilities = {
      enable = true;
    };
  };
}
