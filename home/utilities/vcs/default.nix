{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn {
    inherit config;
    dir = ./.;
    base = [ "myHomeModules" "utilities" "vcs" ];
  };

  cfg = config.myHomeModules.utilities.vcs;
in {
  imports = [] ++ modules;

  options.myHomeModules.utilities.vcs = {
    user = {
      name = lib.mkOption {
        type = lib.types.str;
        description = "VCS username";
      };

      email = lib.mkOption {
        type = lib.types.str;
        description = "VCS email";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    myHomeModules.utilities.vcs = {
      user = {
        name = "UserOfNames";
        email = "lexical.parse@gmail.com";
      };
    };
  };
}
