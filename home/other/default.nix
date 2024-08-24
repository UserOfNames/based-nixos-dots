{ config, myLib, ... }:

let
  cfg = config.myHomeModules.other;
in {
  imports = [] ++ (myLib.importFilesIn ./.);
}
