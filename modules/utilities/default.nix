{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.utilities;
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
      gnupg
      helvum
      jmtpfs
      ripgrep
      tree
      wl-clip-persist
      wl-clipboard
    ];
  };
}
