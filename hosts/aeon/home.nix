{ config, pkgs, ... }:

let
  userName = config.myModules.system.mainUser.userName;
in {
  imports = [
    ./modules.nix
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
}
