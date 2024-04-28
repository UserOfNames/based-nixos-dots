# Template for disko. Credit to Vimjoyer for parts of this.
# Single disk, btrfs on luks
{ inputs, ... }:

{
  imports = [ inputs.disko.nixosModules.disko ];

  disko.devices = {
    disk.main = {
      device = "/dev/sda";
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            name = "ESP";
            size = "1G";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "defaults" ];
            };
          };

          luks = {
            size = "100%";
            content = {
              name = "crypted";
              type = "luks";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                subvolumes = {
                  "@" = {
                    mountpoint = "/";
                    mountOptions = [ "compress-force=zstd:1" "noatime" "noautodefrag" "space_cache=v2" ];
                  };
                  "@home" = {
                    mountpoint = "/home";
                    mountOptions = [ "compress-force=zstd:1" "noatime" "noautodefrag" "space_cache=v2" ];
                  };
                  "@nix" = {
                    mountpoint = "/nix";
                    mountOptions = [ "compress-force=zstd:1" "noatime" "noautodefrag" "space_cache=v2" ];
                  };
                  "@log" = {
                    mountpoint = "/var/log";
                    mountOptions = [ "compress-force=zstd:1" "noatime" "noautodefrag" "space_cache=v2" ];
                  };
                  "@swap" = {
                    mountpoint = "/.swapvol";
                    swap.swapfile.size = "8G";
                  };
                  # FIXME vms setup
                  # "vms" = {
                  #   mountpoint = "$HOME";
                  # };
                };
              };
            };
          };
        };
      };
    };
  };
}
