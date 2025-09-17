{ lib, myLib, ... }:

let
  modules = myLib.importGroupsIn ./. [ "myHomeModules" ];
in {
  imports = [] ++ modules;

  options.myHomeModules.userName = lib.mkOption {
    default = "zdbg";
    description = "Set home-manager username. On NixOS systems, this should be the same as config.myModules.system.mainUser.userName";
  };

  config = {
    programs.home-manager.enable = true;

    xdg = {
      # Disabled by plasma module
      mimeApps.enable = lib.mkDefault true;

      userDirs = {
        enable = lib.mkDefault true;
        createDirectories = lib.mkDefault true;
      };
    };
  };
}
