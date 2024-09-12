{ config, pkgs, ... }:

let
  userName = config.myModules.system.mainUser.userName;
in {
  imports = [
    ../../home
  ];

  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    stateVersion = "24.05"; # stateVersion should match the NixOS stateVersion and should not be changed!

    packages = with pkgs; [
      bottles
      prismlauncher
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
      hyprland.enable = false;
    };

    utilities = {
      enable = true;
      syncthing.enable = true;
    };
  };
}
