{ config, pkgs, ... }:

{
  imports = [
    ../../home
  ];

  home = {
    username = config.myModules.system.user.userName;
    homeDirectory = "/home/${config.myModules.system.user.userName}";
    stateVersion = "23.11";

    packages = with pkgs; [
      libreoffice-fresh
      obs-studio
      qbittorrent
    ];
  };

  myHomeModules = {
    other = {
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
