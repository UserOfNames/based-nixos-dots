{ config, lib, ... }:

let
  cfg = config.myHomeModules.utilities.git;
in {
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "UserOfNames";
      userEmail = "lightninguy.yoyo@gmail.com";
    };
  };
}
