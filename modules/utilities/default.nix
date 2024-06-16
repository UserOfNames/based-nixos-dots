{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.utilities;
  dtrue = lib.mkDefault true;
in {
  imports = [
    ../../options.nix
    ./thunar.nix
    ./virtualization.nix
  ];

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      _7zz
      brightnessctl
      fzf
      gnupg
      helvum
      jmtpfs
      ripgrep
      tree
      wl-clip-persist
      wl-clipboard
    ];

    myModules.utilities = {
      # thunar.enable = dtrue;
      # virtualization.enable = dtrue;
    };
  };
}
