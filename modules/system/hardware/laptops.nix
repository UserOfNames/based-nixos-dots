{ config, pkgs, lib, ... }:

{
  options = {
    myModules.hardware.laptops.enable = lib.mkEnableOption "Enable options for laptops";
  };

  config = lib.mkIf config.myModules.hardware.laptops.enable {
    services.libinput.enable = true;
  };
}
