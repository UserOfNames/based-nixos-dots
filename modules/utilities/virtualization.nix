{ config, pkgs, ... }:

{
  # FIXME finish VM setup, hm declarations, btrfs subvol, etc.
  virtualisation.libvirtd.enable = true;
  # I am a GUI scrub. Sad!
  programs.virt-manager.enable = true;
}
