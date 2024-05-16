{ config, pkgs, lib, ... }:

{
  options = {
    myModules.utilities.virtualization.enable = lib.mkEnableOption "Enable virtualization module";
  };

  config = lib.mkIf config.myModules.utilities.virtualization.enable {
    # FIXME finish VM setup
    virtualisation.libvirtd.enable = true;
    # I am a GUI scrub. Sad!
    programs.virt-manager.enable = true;
  };
}
