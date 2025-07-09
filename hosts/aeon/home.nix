{ osConfig, pkgs, ... }:

let
  userName = osConfig.myModules.system.mainUser.userName;

  # stateVersion is shared with the NixOS stateVersion
  stateVersion = osConfig.system.stateVersion;
in {
  imports = [
    ../../home
  ];

  home = {
    inherit stateVersion;
    username = userName;
    homeDirectory = "/home/${userName}";

    packages = with pkgs; [
      qbittorrent
    ];
  };

  wayland.windowManager.hyprland.settings.input."numlock_by_default" = false;

  myHomeModules = {
    inherit userName;

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
