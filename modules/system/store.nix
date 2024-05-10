{ config, pkgs, lib, ... }:

{
  options = {
    module-store.enable = lib.mkEnableOption "Enable store module";
  };

  config = lib.mkIf config.module-store.enable {
    # Automatically optimize and collect garbage once per week
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
