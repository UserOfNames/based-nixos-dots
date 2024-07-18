{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities;
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
      nomacs
      qalculate-qt
      trashy
    ];
  };
}
