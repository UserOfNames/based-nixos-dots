{ config, pkgs, lib, myLib, ... }:

let
  cfg = config.myModules.utilities;
in {
  imports = [] ++ (myLib.importFilesIn ./.);

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      _7zz
      cpu-x
      gnupg
      ripgrep
      tree
      wl-clip-persist
      wl-clipboard
    ];
  };
}
