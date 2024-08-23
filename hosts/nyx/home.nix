{ config, pkgs, ... }:

let
  userName = config.myModules.system.mainUser.userName;
in {
  imports = [
    ./modules.nix
    ../../home
  ];

  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    stateVersion = "24.05"; # stateVersion should match the NixOS stateVersion and should not be changed!

    packages = with pkgs; [
      prismlauncher
      qbittorrent
    ];
  };
}
