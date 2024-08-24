{ config, myLib, ... }:

let
  cfg = config.myModules.system;
in {
  imports = [] ++ (myLib.importFilesIn ./.);
}
