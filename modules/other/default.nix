{ config, pkgs, lib, myLib, ... }:

let
  cfg = config.myModules.other;
in {
  imports = [ ../../options.nix ] ++ (myLib.importHelper ./.);
}
