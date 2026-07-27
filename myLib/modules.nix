{ lib, myLib, ... }:

with myLib; {
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
}
