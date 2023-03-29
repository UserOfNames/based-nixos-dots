{ config, pkgs, ... }:

{
  # Basic configs; username, hostname, version, and self-management.
  home.username = "zdbg";
  home.homeDirectory = "/home/zdbg";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  # Import package list and dotfiles
  imports = [
    ./hm-dotfiles/packagelist.nix
    ./hm-dotfiles/zsh/zshrc.nix
    ./hm-dotfiles/git/gitrc.nix
  ];
}
