{ myLib, ... }:

let
  modules = myLib.importModulesInBasic ./. [ "myModules" ];
in {
  imports = [] ++ modules;
}
