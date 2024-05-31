{ config, pkgs, inputs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.xremap;
in {
  imports = [ inputs.xremap-flake.homeManagerModules.default ];

  config = lib.mkIf cfg.enable {
    services.xremap = {
      withWlroots = true;
      config = {
        keymap = [
          {
            name = "Main remaps";
            remap = { "Capslock" = "esc"; };
          }
        ];
      };
    };
  };
}
