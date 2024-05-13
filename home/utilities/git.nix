{ config, lib, ... }:

{
  options = {
    myHomeModules.git.enable = lib.mkEnableOption "Enable git module";
  };

  config = lib.mkIf config.myHomeModules.git.enable {
    programs.git = {
      enable = true;
      userName = "UserOfNames";
      userEmail = "lightninguy.yoyo@gmail.com";
    };
  };
}
