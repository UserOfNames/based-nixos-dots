{ config, pkgs, ... }:

{
  # Basic configs; username, version, and self-management.
  home = {
    username = "zdbg";
    homeDirectory = "/home/zdbg";
    # Do not change stateVersion
    stateVersion = "22.11";
  };
  programs.home-manager.enable = true;

  # Packages to install for zdbg with no configurations
  home.packages = with pkgs; [
    bitwarden
    obs-studio
    qalculate-qt
    qbittorrent
    libreoffice-fresh
    kteatime
    spectacle
  ];

  # Import configurations for zdbg
  imports = [
    ./zsh
    ./git
    # ./neovim
    ./newsboat
    ./ytdlp
    ./mpv
    ./firefox
    ./nixvim.nix
  ];
}
