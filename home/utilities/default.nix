{ config, pkgs, lib, ... }:

let dtrue = lib.mkDefault true; in {
  imports = [
    ./lf
    ./neovim
    ./btop.nix
    ./firefox.nix
    ./foot.nix
    ./fuzzel.nix
    ./git.nix
    ./tmux.nix
    ./xremap.nix
    ./zathura.nix
  ];

  options = {
    myHomeModules.utilities.enable = lib.mkEnableOption "Enable 'utilities' home module group";
  };

  config = {
    myHomeModules.utilities = lib.mkIf config.myHomeModules.utilities.enable {
      lf.enable = dtrue;
      neovim.enable = dtrue;
      btop.enable = dtrue;
      firefox.enable = dtrue;
      foot.enable = dtrue;
      fuzzel.enable = dtrue;
      git.enable = dtrue;
      tmux.enable = dtrue;
      xremap.enable = dtrue;
      zathura.enable = dtrue;
    };
  };
}
