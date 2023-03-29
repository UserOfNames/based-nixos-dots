{
  description = "NixOS configuration with home manager (minimal)";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {
    home-manager,
    nixpkgs,
    ...
  }:

  {
    nixosConfigurations = {
      nyx = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.zdbg = import ./home.nix;
          }
        ];
      };
    };
  };
}
