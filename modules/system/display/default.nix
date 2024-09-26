{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn {
    inherit config;
    dir = ./.;
    base = [ "myModules" "system" "display" ];
    excludeConfigs = [
      "cosmic"
      "hyprland"
      "plasma"
    ];
  };

  cfg = config.myModules.system.display;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    programs.xwayland.enable = true;
    services = {
      xserver = {
        enable = true;
        xkb = {
          layout = "us";
        };
      };
    };
  };
}
