{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities;
  dtrue = lib.mkDefault true;
in {
  imports = [
    ../../options.nix
    ./yazi
    ./neovim
    ./btop.nix
    ./firefox.nix
    ./fzf.nix
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
      yazi.enable = dtrue;
      neovim.enable = dtrue;
      btop.enable = dtrue;
      firefox.enable = dtrue;
      fzf.enable = dtrue;
      git.enable = dtrue;
      kitty.enable = dtrue;
      mpd.enable = dtrue;
      mpv.enable = dtrue;
      ncmpcpp.enable = dtrue;
      tmux.enable = dtrue;
      zathura.enable = dtrue;
    };
  };
}
