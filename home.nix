{ config, pkgs, ... }:

{
  # Basic configs; username, hostname, version, and self-management.
  home.username = "zdbg";
  home.homeDirectory = "/home/zdbg";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    mpv
    libreoffice-fresh
    bitwarden
    obs-studio
    kate
    qalculate-qt
    yt-dlp
    qbittorrent
    kteatime
    newsboat
    spectacle
    neomutt
    steam
  ];

  # Import and dotfiles
  imports = [
    ./hm-dotfiles/zsh
    ./hm-dotfiles/git
    ./hm-dotfiles/neovim
    ./hm-dotfiles/newsboat
    ./hm-dotfiles/ytdlp
    ./hm-dotfiles/mpv
  ];
}
