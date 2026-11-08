{ config, lib, ... }:

let
  vcs = config.myHomeModules.utilities.vcs;
  cfg = vcs.jujutsu;
in {
  config = lib.mkIf cfg.enable {
    programs.jujutsu = {
      enable = true;

      settings = {
        user = vcs.user;
      };
    };
  };
}
