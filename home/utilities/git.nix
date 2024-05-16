{ config, lib, ... }:

{
  options = {
    myHomeModules.utilities.git.enable = lib.mkEnableOption "Enable git user configuration";
  };

  config = lib.mkIf config.myHomeModules.utilities.git.enable {
    programs.git = {
      enable = true;
      userName = "UserOfNames";
      userEmail = "lightninguy.yoyo@gmail.com";
    };
  };
}
