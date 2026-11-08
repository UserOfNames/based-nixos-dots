{ config, lib, ... }:

let
  vcs = config.myHomeModules.utilities.vcs;
  cfg = vcs.git;
in {
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;

      signing.format = null;

      settings = {
        user = vcs.user;
      };
    };
  };
}
