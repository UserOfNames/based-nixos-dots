{ config, pkgs, lib, myLib, ... }:

let
  cfg = config.myModules.utilities;
  mke = lib.mkEnableOption;
  lmd = lib.mkDefault;
in {
  imports = [] ++ (myLib.importFilesIn ./.);

  options.myModules.utilities = {
    enable = mke "Enable 'utilities' NixOS module group";
    thunar.enable = mke "Enable thunar";
    virtualization.enable = mke "Enable virtualization";
  };

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

    myModules.utilities = {
      # thunar.enable = lmd cfg.enable;
      # virtualization.enable = lmd cfg.enable;
    };
  };
}
