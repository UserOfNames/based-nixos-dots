{ config, pkgs, lib, myLib, ... }:

let
  cfg = config.myHomeModules.utilities;
in {
  imports = [ ../../options.nix ] ++ (myLib.importHelper ./.);

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
