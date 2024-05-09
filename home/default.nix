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
    fastfetch
    libreoffice-fresh
    mpc-cli
    obs-studio
    qalculate-qt
    qbittorrent
    qimgv
    ripdrag
    swww
    texliveFull
  ];

  # Import configurations for zdbg
  imports = [
    ./btop
    ./firefox
    ./foot
    ./fuzzel
    ./git
    ./hyprland
    ./lf
    ./mako
    ./mpd
    ./mpv
    ./ncmpcpp
    ./neovim
    ./newsboat
    ./tmux
    ./waybar
    ./xremap
    ./ytdlp
    ./zathura
    ./zsh
  ];
}
