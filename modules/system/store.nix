{ config, pkgs, lib, ... }:

{
  options = {
    myModules.store.enable = lib.mkEnableOption "Enable store module";
  };

  config = lib.mkIf config.myModules.store.enable {
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
