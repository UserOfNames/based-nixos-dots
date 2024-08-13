{ config, myLib, ... }:

let
  cfg = config.myModules.other;
in {
  imports = [ ../../options ] ++ (myLib.importHelper ./.);
}
