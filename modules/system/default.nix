{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn {
    inherit config;
    dir = ./.;
    base = [ "myModules" "system" ];
  };

  cfg = config.myModules.system;
in {
  imports = [] ++ modules;

  options.myModules.system = {
    mainUser.userName = lib.mkOption {
      default = "zdbg";
      type = lib.types.str;
      description = "Main user username";
    };
  };

  config = lib.mkIf cfg.enable {
  };
}
