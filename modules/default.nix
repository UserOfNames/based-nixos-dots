{ myLib, ... }:

let
  modules = myLib.importGroupsIn ./. [ "myModules" ];
in {
  imports = [] ++ modules;
}
