{ config, inputs, lib, ... }:

let
  cfg = config.myModules.system.display.cosmic;
in {
  imports = [ inputs.nixos-cosmic.nixosModules.default ];

  config = lib.mkIf cfg.enable {
    nix.settings = {
      substituters = [ "https://cosmic.cachix.org/" ];
      trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
    };

    services = {
      desktopManager.cosmic.enable = true;
      displayManager.cosmic-greeter.enable = true;
    };

    myModules.system.display.sddm.enable = false;
  };
}
