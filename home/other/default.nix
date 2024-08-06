{ config, pkgs, lib, myLib, ... }:

let
  cfg = config.myHomeModules.other;
in {
  imports = [ ../../options.nix ] ++ (myLib.importHelper ./.);
}
