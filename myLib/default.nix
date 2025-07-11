{inputs, ...}: let
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
  # so use this for imports instead of plain filesIn
  importFilesIn = dir:
    lib.lists.remove (dir + "/default.nix") (filesIn dir);

  # Create an option: options.(base).(filename).enable
  # (base) should be a list such as [ "myModules" "system" ]
  mkModuleToggle = base: name:
    lib.attrsets.setAttrByPath
      ([ "options" ] ++ base ++ [ name ] ++ [ "enable" ])
      (lib.mkEnableOption "Enable ${name} module");

  # Bind a config to its group config with very low priority
  # lib.mkDefault will override configs made by this
  mkConfigDefault = base: name: config:
    let
      groupCfg = lib.attrsets.getAttrFromPath (base ++ [ "enable" ]) config;
    in
      lib.attrsets.setAttrByPath
        ([ "config" ] ++ base ++ [ name ] ++ [ "enable" ])
        (lib.mkOverride 1250 groupCfg);

  # importFilesIn and make enable options for each based on filename
  # Also apply mkConfigDefault to each module
  # Exclude configs or options by filename
  importModulesIn = {
    dir,
    base,
    config,
    excludeOptions ? [],
    excludeConfigs ? []
  }:
    let
      modules = importFilesIn dir;
    in 
      []
      ++ modules
      ++ (map (file:
          if (builtins.elem (fileName file) excludeOptions)
          then {}
          else mkModuleToggle base (fileName file))
      modules)
      ++ (map (file:
          if ((builtins.elem (fileName file) excludeConfigs) || (builtins.elem (fileName file) excludeOptions))
          then {}
          else mkConfigDefault base (fileName file) config)
      modules);

  # Basic version of importModulesIn, used for
  # base default.nix in modules/ and home/
  # where the extra features aren't wanted
  importGroupsIn = dir: base:
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
