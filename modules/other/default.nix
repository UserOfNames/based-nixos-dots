{ config, myLib, ... }:

let
  cfg = config.myModules.other;
in {
  imports = [] ++ (myLib.importFilesIn ./.);
}
