{ config, pkgs, lib, ... }:

let dtrue = lib.mkDefault true; in {
  imports = [
    ./gaming.nix
  ];

  options = {
    myModules.other.enable = lib.mkEnableOption "Enable 'other' module group";
  };

  config = {
    myModules.other = lib.mkIf config.myModules.other.enable {
      gaming.enable = dtrue;
    };
  };
}
