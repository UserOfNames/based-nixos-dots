{ config, pkgs, ... }:

{
  imports = [
    ./modules.nix
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
}
