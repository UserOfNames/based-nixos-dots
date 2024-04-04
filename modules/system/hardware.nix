{ config, pkgs, ... }:

{
  # Enable printing and sound (pipewire w/ alsa, pulse, and wireplumber)
  # Do not use sound.enable as it is only meant for ALSA
  services.printing.enable = true;

  #rtkit is optional but recommended for pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    #jack.enable = true;
  };
}
