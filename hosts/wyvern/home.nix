{ pkgs, ... }:

let
  userName = "zdbg";
in {
  imports = [
    ../../home
  ];

  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    stateVersion = "24.05"; # stateVersion should match the NixOS stateVersion and should not be changed!

    packages = with pkgs; [
      qbittorrent
      vscode-fhs
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
      hyprland.enable = true;
    };

    utilities = {
      enable = true;
    };
  };
}
