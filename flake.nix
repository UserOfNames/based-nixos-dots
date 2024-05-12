{
  description = "NixOS configuration with home manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/nur";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap-flake.url = "github:xremap/nix-flake";
  };

  outputs = { self, nixpkgs, home-manager, nur, disko, ... }@inputs:
  let
    system = "x86_64-linux";

    # Enable home-manager as a flake module
    home = [
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs; };
          users.zdbg = import ./home;
        };
      }
    ];

    mkHost = hostname:
      nixpkgs.lib.nixosSystem {
       inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/${hostname}
          ./modules
          { nixpkgs.overlays = [ nur.overlay ]; }
        ] ++ home;
      };

  in {
    nixosConfigurations = {
      nyx = mkHost "nyx";
      aeon = mkHost "aeon";
    };
  };
}
