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
      # avoid assertion related to qt style
      kvantum.enable = false;
      firefox.enable = false;
      waybar.enable = false;
      nvim.enable = false;
      hyprlock.enable = false;

      # catppuccin/nix doesn't hardcode any colors in Hyprland, it just exposes
      # some color names to use. For portability, I copied the theme file
      # locally. As such, we don't need it enabled here.
      hyprland.enable = false;

      # I set GTK icons manually in `./theme.nix`.
      gtk.icon.enable = false;

      # I set cursors manually in `./cursor.nix`.
      cursors.enable = false;
    };
  };
}
