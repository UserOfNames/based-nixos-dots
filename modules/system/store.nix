{ config, pkgs, lib, ... }:

{
  options = {
    myModules.system.store.enable = lib.mkEnableOption "Enable store module";
  };

  config = lib.mkIf config.myModules.system.store.enable {
    nix = {
      optimise = {
        automatic = true;
        dates = [
          "weekly"
        ];
      };

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    };
  };
}
