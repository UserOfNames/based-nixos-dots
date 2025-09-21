{ lib, myLib, ... }:

let
  modules = myLib.importGroupsIn ./. [ "myHomeModules" ];
in {
  imports = [] ++ modules;

  options.myHomeModules.userName = lib.mkOption {
    type = lib.types.str;
    description = "Set home-manager username.";
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
