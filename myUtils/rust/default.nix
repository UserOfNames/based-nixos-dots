{ config, pkgs, lib, inputs, myLib, ... }:

let
  cfg = config.myUtils.rust;
  osDotsPath = config.myModules.dotsPath;

  rust-core = inputs.rust-utils.packages.${pkgs.system}.default;

  utils = [
    {
      name = "nix-utils";
      envVars = {
        OS_DOTS_PATH = osDotsPath;
      };
      runtimePkgs = with pkgs; [
        nix
        nixos-rebuild
      ];
    }

    {
      name = "awww-random";
      runtimePkgs = with pkgs; [
        awww
      ];
    }
  ];

  mkWrappedUtil = util: myLib.mkWrappedBinary {
    inherit pkgs;
    binPath = lib.getExe' rust-core util.name;
    outName = "${util.name}";
    envVars = util.envVars or {};
    runtimePkgs = util.runtimePkgs or [];
  };

  mkOptionalWrappedUtil = util: lib.optionals cfg.${util.name}.enable [ (mkWrappedUtil util) ];

  optionalWrappedUtils = lib.concatMap mkOptionalWrappedUtil utils;

  mkUtilToggle = util: myLib.mkModuleToggle
    [ "myUtils" "rust" ]
    util.name;

  mkUtilConfig = util: myLib.mkConfigDefault
    [ "myUtils" "rust" ]
    util.name
    config;
in {
  imports = []
    ++ (map mkUtilToggle utils)
    ++ (map mkUtilConfig utils);

  # We don't need a `lib.mkIf` guard here because all `utils` are already
  # properly disabled by `lib.optionals`.
  config = {
    environment.systemPackages = optionalWrappedUtils;
  };
}
