{ config, pkgs, ... }:

{
  # Basic configs; username, hostname, version, and self-management.
  home.username = "zdbg";
  home.homeDirectory = "/home/zdbg";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    bitwarden
    obs-studio
    qalculate-qt
    qbittorrent
    libreoffice-fresh
    kteatime
    spectacle
    neomutt
  ];

  # Import dotfiles
  imports = [
    ./zsh
    ./git
    ./neovim
    ./newsboat
    ./ytdlp
    ./mpv
    ./firefox
    ./neomutt
  ];
}
