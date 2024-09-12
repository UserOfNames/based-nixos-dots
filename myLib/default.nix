{ inputs, ... }:

let
  lib = inputs.nixpkgs.lib;
  myLib = (import ./default.nix) {inherit inputs;};
in rec {
  # Create a new host
  mkHost = hostname:
    lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs myLib; };
      modules = [
        ../hosts/${hostname}
        ../modules
        ../scripts
        { nixpkgs.overlays = [ inputs.nur.overlay ]; }
      ];
    };

  # Create a home-manager configuration
  mkHome = userName: homeFile: {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs myLib; };
    users.${userName} = import homeFile;
  };

  # Get the name of a file
  fileName = path:
    builtins.head (builtins.split "\\." (builtins.baseNameOf path));

  # Get a list of filenames in a directory
  fileNamesIn = dir:
    builtins.attrNames (builtins.readDir dir);

  # Get a list of files in a directory
  filesIn = dir:
    map (filename: dir + "/${filename}") (fileNamesIn dir);

  # Get a list of files in a directory except default.nix
  # Importing default.nix into itself causes infinite recursion,
  # so this can be used to simplify and automate imports
  importFilesIn = dir:
    lib.lists.remove (dir + "/default.nix") (filesIn dir);

  # Create an option: options.(base).(filename).enable
  # base should be a string like "myModules.system"
  mkModuleToggle = base: name: {
    options.${base}.${name}.enable = lib.mkEnableOption "Enable ${name} module";
  };

  # importFilesIn and add enable options for each based on filename
  # Enable modules by default with mkConfigDefault
  importModulesIn = dir: base:
    let
      modules = importFilesIn dir;
    in 
      (map (file: mkModuleToggle base (fileName file)) modules)
      ++ importFilesIn dir;

  # nixvim helpers
  nixvim = {
    mkMap = mode: key: action: desc: {
      inherit mode key action;
      options = {
        inherit desc;
        silent = true;
        noremap = true;
      };
    };

    mkOptMap = mode: key: action: desc: opts:
      (nixvim.mkMap mode key action desc) // { options = opts; };

    mkRawMap = mode: key: raw: desc:
      (nixvim.mkMap mode key { __raw = raw; } desc);

    mkFunctionMap = mode: key: body: desc:
      (nixvim.mkRawMap mode key ''function() ${body} end'' desc);
  };
}
