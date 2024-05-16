{ config, pkgs, lib, ... }:

{
  options = {
    myModules.system.hardware.laptops.enable = lib.mkEnableOption "Enable options for laptops";
  };

  config = lib.mkIf config.myModules.system.hardware.laptops.enable {
    services.libinput.enable = true;
  };
}
