{ config, pkgs, ... }:

{
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
}
