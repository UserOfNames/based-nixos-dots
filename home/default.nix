{ config, pkgs, ... }:

{
  # Basic settings: username, version, and self-management.
  home = {
    username = "zdbg";
    homeDirectory = "/home/zdbg";
    # Do not change stateVersion
    stateVersion = "23.11";
  };
  programs.home-manager.enable = true;

  # Packages to install for zdbg with no configurations
  home.packages = with pkgs; [
    # bitwarden
    obs-studio
    qalculate-qt
    qbittorrent
    libreoffice-fresh
    kteatime
    spectacle
  ];

  # Import configurations for zdbg
  imports = [
    ./alacritty
    ./firefox
    ./git
    ./hyprland
    ./lf
    ./mpv
    ./neovim
    ./newsboat
    ./tmux
    ./xremap
    ./ytdlp
    ./zsh
  ];
}
