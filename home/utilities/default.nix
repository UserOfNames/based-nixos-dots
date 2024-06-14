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
    ./mpd.nix
    ./mpv.nix
    ./ncmpcpp.nix
    ./syncthing.nix
    ./tmux.nix
    ./zathura.nix
  ];

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      bitwarden
      foliate
      qalculate-qt
      qimgv
      trashy
    ];

    myHomeModules.utilities = {
      lf.enable = dtrue;
      neovim.enable = dtrue;
      btop.enable = dtrue;
      firefox.enable = dtrue;
      git.enable = dtrue;
      kitty.enable = dtrue;
      mpd.enable = dtrue;
      mpv.enable = dtrue;
      ncmpcpp.enable = dtrue;
      # syncthing.enable = dtrue;
      tmux.enable = dtrue;
      zathura.enable = dtrue;
    };
  };
}
