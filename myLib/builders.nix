{ inputs, lib, myLib, ... }:

{
  # Create a new host
  mkHost = hostname:
    lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs myLib; };
      modules = [
        ../hosts/${hostname}
        ../modules
        ../myUtils
        { networking.hostName = hostname; }
        { nixpkgs.overlays = [ inputs.nur.overlays.default ]; }
      ];
    };

  # Create a home-manager configuration
  mkHome = userName: homeFile: {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs myLib;};
    users.${userName} = import homeFile;
  };
}
