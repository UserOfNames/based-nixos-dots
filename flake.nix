{
  description = "NixOS configuration with home manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = github:nix-community/NUR;

  };
  outputs = inputs@{
    self,
    home-manager,
    nixpkgs,
    nur,
    ...
  }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      lib = nixpkgs.lib;

      home = [
        home-manager.nixosModules.home-manager
        {
          home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.zdbg = import ./home.nix;
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
          ] ++ home;
        };
      };
    };
}
