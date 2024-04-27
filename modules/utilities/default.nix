{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./neovim.nix
    ./tmux.nix
    ./virtualization.nix
  ];
}
