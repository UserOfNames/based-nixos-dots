{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities;
  dtrue = lib.mkDefault true;
in {
  imports = [
    ../../options.nix
    ./lf
    ./neovim
    ./btop.nix
    ./firefox.nix
    ./git.nix
    ./kitty.nix
    ./syncthing.nix
    ./tmux.nix
    ./zathura.nix
  ];

  config = lib.mkIf cfg.enable {
    myHomeModules.utilities = {
      lf.enable = dtrue;
      neovim.enable = dtrue;
      btop.enable = dtrue;
      firefox.enable = dtrue;
      git.enable = dtrue;
      kitty.enable = dtrue;
      # syncthing.enable = dtrue;
      tmux.enable = dtrue;
      zathura.enable = dtrue;
    };
  };
}
