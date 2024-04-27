{
  description = "NixOS configuration with home manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/nur";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nur, disko, ... }@inputs:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;

    # Enable home-manager as a flake module, user must be zdbg
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
  
  in {
    nixosConfigurations = {
      # Main desktop
      nyx = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nyx
          ./modules
          { nixpkgs.overlays = [ nur.overlay ]; }
        ] ++ home;
      };
    };
  };
}
