{ lib, myLib, ... }:

{
  imports = [] ++ (myLib.importFilesIn ./.);

  options.myHomeModules.userName = lib.mkOption {
    default = "zdbg";
    description = "Set home-manager username. On NixOS systems, this should be the same as the same as config.myModules.system.mainUser.userName";
  };

  config = {
    programs.home-manager.enable = true;

    # Disabled by plasma module
    xdg.mimeApps.enable = lib.mkDefault true;
  };
}
