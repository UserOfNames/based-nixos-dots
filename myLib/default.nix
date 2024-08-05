{ inputs, ... }:

let
  myLib = (import ./default.nix) {inherit inputs;};
in {
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
