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
    builtins.head (builtins.split "\\." (baseNameOf path));

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

  # Catppuccin mocha color mapping
  # https://github.com/catppuccin/catppuccin
  catppuccinMocha = {
    rosewater = "f5e0dc";
    flamingo = "f2cdcd";
    pink = "f5c2e7";
    mauve = "cba6f7";
    red = "f38ba8";
    maroon = "eba0ac";
    peach = "fab387";
    yellow = "f9e2af";
    green = "a6e3a1";
    teal = "94e2d5";
    sky = "89dceb";
    sapphire = "74c7ec";
    blue = "89b4fa";
    lavender = "b4befe";
    text = "cdd6f4";
    subtext1 = "bac2de";
    subtext0 = "a6adc8";
    overlay2 = "9399b2";
    overlay1 = "7f849c";
    overlay0 = "6c7086";
    surface2 = "585b70";
    surface1 = "45475a";
    surface0 = "313244";
    base = "1e1e2e";
    mantle = "181825";
    crust = "11111b";
  };

  # System base16 scheme; catppuccin mocha
  # https://github.com/catppuccin/base16/blob/main/base16/mocha.yaml
  base16Scheme = with catppuccinMocha; {
    base00 = base;
    base01 = mantle;
    base02 = surface0;
    base03 = surface1;
    base04 = surface2;
    base05 = text;
    base06 = rosewater;
    base07 = lavender;
    base08 = red;
    base09 = peach;
    base0A = yellow;
    base0B = green;
    base0C = teal;
    base0D = blue;
    base0E = mauve;
    base0F = flamingo;
  };
}
