{ config, pkgs, lib, myLib, ... }:

let
  cfg = config.myModules.system;
in {
  imports = [ ../../options.nix ] ++ (myLib.importHelper ./.);
}
