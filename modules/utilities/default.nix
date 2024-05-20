{ config, pkgs, lib, ... }:

let dtrue = lib.mkDefault true; in {
  imports = [
    ./syncthing.nix
    ./virtualization.nix
    ./xremap-users.nix
  ];

  options = {
    myModules.utilities.enable = lib.mkEnableOption "Enable 'utilities' module";
  };

  config = {
    myModules.utilities = lib.mkIf config.myModules.utilities.enable {
      # syncthing.enable = dtrue;
      # virtualization.enable = dtrue;
      xremapusers.enable = dtrue;
    };
  };
}
