{ config, pkgs, lib, ... }:

{
  options = {
    myModules.hardware.enable = lib.mkEnableOption "Enable hardware module";
  };

  config = lib.mkIf config.myModules.hardware.enable {
    services.printing.enable = true;

    # rtkit is optional but recommended for pipewire
    # Do not use sound.enable as it is only meant for ALSA
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      #jack.enable = true;
    };
  };
}
