{ config, lib, ... }:

let
  cfg = config.myModules.system.display.cosmic;
  userName = config.myModules.system.mainUser.userName;
in {
  config = lib.mkIf cfg.enable {
    services = {
      desktopManager.cosmic.enable = true;
      displayManager.cosmic-greeter.enable = true;
    };

    myModules.system.display.sddm.enable = false;

    home-manager.users."${userName}".xdg = {
      mimeApps.enable = false;
      userDirs = {
        enable = false;
        createDirectories = false;
      };
    };
  };
}
