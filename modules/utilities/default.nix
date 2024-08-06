{ config, pkgs, lib, myLib, ... }:

let
  cfg = config.myModules.utilities;
in {
  imports = [ ../../options.nix ] ++ (myLib.importHelper ./.);

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      _7zz
      brightnessctl
      cpu-x
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
