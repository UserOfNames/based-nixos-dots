{ config, pkgs, lib, ... }:

{
  options = {
    module-virtualization.enable = lib.mkEnableOption "Enable virtualization module";
  };

  config = lib.mkIf config.module-virtualization.enable {
    # FIXME finish VM setup, hm declarations, btrfs subvol, etc.
    virtualisation.libvirtd.enable = true;
    # I am a GUI scrub. Sad!
    programs.virt-manager.enable = true;
  };
}
