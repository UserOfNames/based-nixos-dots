{ myLib, ... }:

let
  modules = myLib.importModulesIn ./. [ "myModules" ];
in {
  imports = [] ++ modules;
}
