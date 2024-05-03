{ config, pkgs, ... }:

{
  # Basic settings: username, version, and self-management.
  home = {
    username = "zdbg";
    homeDirectory = "/home/zdbg";
    # FIXME allow different stateVersion per host
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
    spectacle
    fastfetch
    ripdrag
    mpv
    qimgv
  ];

  # Import configurations for zdbg
  imports = [
    ./alacritty
    ./firefox
    ./git
    ./hyprland
    ./lf
    ./mako
    ./mpv
    ./neovim
    ./newsboat
    ./tmux
    ./xremap
    ./ytdlp
    ./zsh
  ];
}
