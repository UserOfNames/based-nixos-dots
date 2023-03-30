{
  description = "NixOS configuration with home manager";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs@{
    self,
    home-manager,
    nixpkgs,
    ...
  }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
	config = { allowUnfree = true; };
      };
      lib = nixpkgs.lib;

    in {
      nixosConfigurations = {

        # Main desktop
        nyx = lib.nixosSystem {
          inherit system;
	  modules = [
	    ./hosts/nyx/nyx.nix 
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
