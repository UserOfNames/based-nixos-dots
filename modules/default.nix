{ lib, myLib, ... }:

let
  modules = myLib.importGroupsIn ./. [ "myModules" ];
in {
  imports = [] ++ modules;

  options.myModules.dotsPath = lib.mkOption {
    type = lib.types.path;
    description = "Path to dotfiles";
  };
}
