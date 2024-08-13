{ config, myLib, ... }:

let
  cfg = config.myModules.system;
in {
  imports = [ ../../options ] ++ (myLib.importHelper ./.);
}
