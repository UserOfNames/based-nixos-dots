{ config, lib, inputs, ... }:

let
  cfg = config.myHomeModules.other.style.catppuccin;
in {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  config = lib.mkIf cfg.enable {
    catppuccin = {
      enable = true;
      autoEnable = true;
      flavor = "mocha";
      gtk.icon.enable = false;
      firefox.enable = false;
      waybar.enable = false;
      nvim.enable = false;
      hyprlock.enable = false;
    };
  };
}
