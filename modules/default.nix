{ lib, myLib, ... }:

let
  modules = myLib.importGroupsIn ./. [ "myModules" ];
in {
  imports = [] ++ modules;

  options.myModules.dotsPath = lib.mkOption {
    description = "Path to dotfiles";
  };
}
