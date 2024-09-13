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
      mainUser.enable = lmd cfg.enable;

      bootloader.enable = lmd cfg.enable;
      locale.enable = lmd cfg.enable;
      network.enable = lmd cfg.enable;
      packages.enable = lmd cfg.enable;
      security.enable = lmd cfg.enable;
      store.enable = lmd cfg.enable;
      zsh.enable = lmd cfg.enable;
    };
  };
}
