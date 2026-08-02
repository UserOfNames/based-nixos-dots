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
      prismlauncher
      qbittorrent
      r2modman
    ];
  };

  myHomeModules = {
    inherit userName;

    host = {
      bluetooth = osConfig.myModules.system.hardware.bluetooth.enable;
    };

    other = {
      enable = true;
      gaming.enable = true;
    };

    system = {
      enable = true;
    };

    utilities = {
      enable = true;
    };
  };
}
