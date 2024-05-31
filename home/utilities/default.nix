{ config, pkgs, lib, ... }:

let
  dtrue = lib.mkDefault true;
in {
  imports = [
    ../../options.nix
    ./lf
    ./neovim
    ./bemenu.nix
    ./btop.nix
    ./firefox.nix
    ./foot.nix
    ./git.nix
    ./kitty.nix
    ./syncthing.nix
    ./tmux.nix
    ./xremap.nix
    ./zathura.nix
  ];

  config = {
    myHomeModules.utilities = lib.mkIf config.myHomeModules.utilities.enable {
      lf.enable = dtrue;
      neovim.enable = dtrue;
      bemenu.enable = dtrue;
      btop.enable = dtrue;
      firefox.enable = dtrue;
      # foot.enable = dtrue;
      git.enable = dtrue;
      kitty.enable = dtrue;
      # syncthing.enable = dtrue;
      tmux.enable = dtrue;
      xremap.enable = dtrue;
      zathura.enable = dtrue;
    };
  };
}
