{ config, pkgs, inputs, lib, ... }:

{
  imports = [ inputs.xremap-flake.homeManagerModules.default ];

  options = {
    myHomeModules.xremap.enable = lib.mkEnableOption "Enable xremap module";
  };

  config = lib.mkIf config.myHomeModules.xremap.enable {

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
