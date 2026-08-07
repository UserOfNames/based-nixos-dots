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
      # TODO: once I start ricing, I may want to reenable some of these
      gtk.icon.enable = false;
      # avoid assertion related to qt style
      kvantum.enable = false;
      firefox.enable = false;
      waybar.enable = false;
      nvim.enable = false;
      hyprlock.enable = false;
    };
  };
}
