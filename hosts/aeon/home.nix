{ config, pkgs, ... }:

{
  imports = [
    ../../home
  ];

  home = {
    username = "zdbg";
    homeDirectory = "/home/zdbg";
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
    };
  };
}
