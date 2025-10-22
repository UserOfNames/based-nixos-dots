{ config, lib, ... }:

let
  cfg = config.myHomeModules.utilities.git;
in {
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "UserOfNames";
          email = "lightninguy.yoyo@gmail.com";
        };
      };
    };
  };
}
