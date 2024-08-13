{ config, lib, ... }:

let
  cfg = config.myModules.utilities.virtualization;
in {
  config = lib.mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
  };
}
