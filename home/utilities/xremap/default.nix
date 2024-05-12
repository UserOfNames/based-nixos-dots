{ config, pkgs, inputs, ... }:

{
  imports = [ inputs.xremap-flake.homeManagerModules.default ];

  services.xremap = {
    # withHypr = true;
    config = {
      keymap = [
        {
          name = "Main remaps";
          remap = { "Capslock" = "esc"; };
        }
      ];
    };
  };
}
