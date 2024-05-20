{ config, pkgs, lib, ... }:

{
  options = {
    myModules.utilities.virtualization.enable = lib.mkEnableOption "Enable virtualization module";
  };

  config = lib.mkIf config.myModules.utilities.virtualization.enable {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
  };
}
