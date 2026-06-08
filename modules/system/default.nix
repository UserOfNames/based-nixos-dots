{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn {
    inherit config;
    dir = ./.;
    base = [ "myModules" "system" ];
    excludeOptions = [
      # There's no conceivable reason to not have a `wheel` user, and assuming
      # `mainUser.userName` is set simplifies a lot of other modules.
      "mainUser"
    ];
  };

  cfg = config.myModules.system;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
  };
}
