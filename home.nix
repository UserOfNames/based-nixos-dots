{ config, pkgs, ... }:

{
  # Basic configs; username, hostname, version, and self-management.
  home.username = "zdbg";
  home.homeDirectory = "/home/zdbg";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
  # Declare user-specific packages here.
  ];

  # Import and dotfiles
  imports = [
    ./hm-dotfiles/zsh
    ./hm-dotfiles/git
    ./hm-dotfiles/neovim
  ];
}
