{ config, myLib, ... }:

let
  cfg = config.myHomeModules.other;
in {
  imports = [ ../../options ] ++ (myLib.importHelper ./.);
}
