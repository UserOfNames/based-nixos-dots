{ config, pkgs, lib, ... }:

let dtrue = lib.mkDefault true; in {
  imports = [
    ./virtualization.nix
    ./xremap-users.nix
  ];

  options = {
    myModules.utilities.enable = lib.mkEnableOption "Enable 'utilities' module";
  };

  config = {
    myModules.utilities = lib.mkIf config.myModules.utilities.enable {
      # virtualization.enable = dtrue;
      xremapusers.enable = dtrue;
    };
  };
}
