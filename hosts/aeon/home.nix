{ config, pkgs, ... }:

let
  userName = config.myModules.system.user.userName;
in {
  imports = [
    ./modules.nix
    ../../home
  ];

  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    stateVersion = "23.11"; # stateVersion should match the NixOS stateVersion and should not be changed!

    wayland.windowManager.hyprland.input."numlock_by_default" = false;

    packages = with pkgs; [
      qbittorrent
    ];
  };
}
