{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn ./. [ "myModules" "system" ];

  cfg = config.myModules.system;
  lmd = lib.mkDefault;
in {
  imports = [] ++ modules;

  options.myModules.system = {
    mainUser.userName = lib.mkOption {
      default = "zdbg";
      description = "Main user username";
    };
  };

  config = lib.mkIf cfg.enable {
    myModules.system = {
      display.enable = lmd true;
      hardware.enable = lmd true;

      mainUser.enable = lmd true;

      bootloader.enable = lmd true;
      locale.enable = lmd true;
      network.enable = lmd true;
      packages.enable = lmd true;
      security.enable = lmd true;
      store.enable = lmd true;
      zsh.enable = lmd true;
    };
  };
}
