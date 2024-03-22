{
  description = "NixOS configuration with home manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/nur";
  };

  outputs = { self, nixpkgs, home-manager, nur, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;

      # Enable NUR, I would like to do this in a more elegant way once I figure it out
      nur = { pkgs, config, ... }: {
        nixpkgs.overlays = [
          inputs.nur.overlay
        ];
      };

      # Enable home-manager as a flake module, user must be zdbg
      home = [
        home-manager.nixosModules.home-manager
        {
          home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.zdbg = import ./home;
          };
        }
      ];
    
    in {
      nixosConfigurations = {
        # Main desktop
        nyx = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/nyx
            nur
          ] ++ home;
        };
      };
    };
}
