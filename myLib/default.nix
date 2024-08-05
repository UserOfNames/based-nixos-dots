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
}
