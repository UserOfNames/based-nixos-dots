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
      bottles
      mindustry-wayland
      prismlauncher
      qbittorrent
      r2modman
    ];
  };

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
    };

    utilities = {
      enable = true;
    };
  };
}
