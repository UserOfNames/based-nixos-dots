{ config, lib, inputs, ... }:

let
  cfg = config.myModules.other.style.catppuccin;
in {
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
  ];

  config = lib.mkIf cfg.enable {
    catppuccin = {
      enable = true;
      autoEnable = false;
      flavor = "mocha";
      accent = "mauve";

      fish.enable = true;
      tty.enable = true;
    };
  };
}
