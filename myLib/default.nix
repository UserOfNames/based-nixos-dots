{ inputs, ... }:

let
  myLib = (import ./default.nix) {inherit inputs;};
in {
  # Create a new host
  mkHost = hostname:
    inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs myLib; };
      modules = [
        ../hosts/${hostname}
        ../home-manager.nix
        ../modules
        ../scripts
        { nixpkgs.overlays = [ inputs.nur.overlay ]; }
      ];
    };

  # Get all files in directory except default.nix (credit to vimjoyer)
  importHelper = dir: (map (filename: dir + "/${filename}") (builtins.attrNames (builtins.removeAttrs (builtins.readDir dir) [ "default.nix" ])));

  # nixvim helpers
  nixvim = {
    mkMap = mode: key: action: desc: {
      inherit mode key action;
      options = {
        silent = true;
        noremap = true;
      };
    };

    mkOptMap = mode: key: action: desc: opts:
      (myLib.nixvim.mkMap mode key action desc) // { options = opts; };
  };
}
