{ config, pkgs, ... }:

{
  imports = [
    ../../home
  ];

  home = {
    username = "zdbg";
    homeDirectory = "/home/zdbg";
    stateVersion = "24.05";

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
      foot.enable = true;
      syncthing.enable = true;
    };
  };
}
