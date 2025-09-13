{ config, pkgs, lib, myLib, ... }:

let
  modules = myLib.importModulesIn {
    inherit config;
    dir = ./.;
    base = [ "myModules" "utilities" ];
    excludeConfigs = [
      "thunar"
      "virtualization"
      "wireshark"
    ];
  };

  cfg = config.myModules.utilities;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      _7zz
      cpu-x
      gnupg
      ripgrep
      tree
      wl-clip-persist
      wl-clipboard
    ];
  };
}
