{ config, pkgs, lib, inputs, myLib, ... }:

let
  cfg = config.myUtils.rust;
  osDotsPath = config.myModules.dotsPath;

  rust-core = inputs.rust-utils.packages.${pkgs.system}.default;

  utils = [
    {
      name = "nix-utils";
      envVars = [
        {
          name = "OS_DOTS_PATH";
          value = osDotsPath;
        }
      ];
      runtimePkgs = with pkgs; [
        nix
        nixos-rebuild
      ];
    }
  ];

  # Helper to wrap individual binaries from the core bundle
  mkWrappedUtil = util:
  let
    envVars = lib.strings.concatMapStringsSep
      " "
      (item: "--set ${lib.escapeShellArg item.name} ${lib.escapeShellArg item.value}")
      util.envVars;

    pathArg = lib.optionalString (util.runtimePkgs != [])
      "--prefix PATH : ${lib.makeBinPath util.runtimePkgs}";
  in
    pkgs.runCommand
      util.name
      {
        nativeBuildInputs = [ pkgs.makeWrapper ];
      }
      ''
        mkdir -p $out/bin

        # Pull the specific binary from the core bundle and wrap it
        makeWrapper ${rust-core}/bin/${util.name} $out/bin/${util.name} \
          ${envVars} \
          ${pathArg}
      '';

  mkOptionalWrappedUtil = util: lib.optionals cfg.${util.name}.enable [ (mkWrappedUtil util) ];

  mkUtilToggle = util: myLib.mkModuleToggle
    [ "myUtils" "rust" ]
    util.name;

  mkUtilConfig = util: myLib.mkConfigDefault
    [ "myUtils" "rust" ]
    util.name
    config;

  optionalWrappedUtils = lib.concatMap mkOptionalWrappedUtil utils;
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
