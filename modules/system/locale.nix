{ config, pkgs, lib, ... }:

{
  options = {
    myModules.locale.enable = lib.mkEnableOption "Enable locale module";
  };

  config = lib.mkIf config.myModules.locale.enable {
    # American Eastern time, US english
    time.timeZone = "America/New_York";

    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
      };
    };
  };
}
