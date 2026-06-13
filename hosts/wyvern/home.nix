{ osConfig, pkgs, ... }:

let
  userName = osConfig.myModules.system.mainUser.userName;

  homeDirectory = "/home/${userName}";

  # stateVersion is shared with the NixOS stateVersion
  stateVersion = osConfig.system.stateVersion;
in {
  imports = [
    ../../home
  ];

  home = {
    inherit stateVersion homeDirectory;
    username = userName;

    packages = with pkgs; [
      qbittorrent
    ];
  };

  programs.zsh.dirHashes = {
    share = "/mnt/Shared/";
  };

  myHomeModules = {
    inherit userName;

    other = {
      enable = true;
    };

    system = {
      enable = true;

      hyprland = {
        enable = true;
        wallpapers_path = "${homeDirectory}/Pictures/Wallpapers";
      };
    };

    utilities = {
      enable = true;
    };
  };
}
