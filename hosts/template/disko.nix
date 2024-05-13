{ device ? throw "Specify device name, e.g. /dev/sda", ... }:

{
  disko.devices = {
    disk.main = {
      inherit device;
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
              mountOptions = [ "defaults" "umask=0077" ];
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
                  "/root" = {
                    mountpoint = "/";
                    mountOptions = [ "compress-force=zstd:1" "noatime" "noautodefrag" "space_cache=v2" ];
                  };
                  "/home" = {
                    mountpoint = "/home";
                    mountOptions = [ "compress-force=zstd:1" "noatime" "noautodefrag" "space_cache=v2" ];
                  };
                  "/nix" = {
                    mountpoint = "/nix";
                    mountOptions = [ "compress-force=zstd:1" "noatime" "noautodefrag" "space_cache=v2" ];
                  };
                  "/log" = {
                    mountpoint = "/var/log";
                    mountOptions = [ "compress-force=zstd:1" "noatime" "noautodefrag" "space_cache=v2" ];
                  };
                  "/swap" = {
                    mountpoint = "/.swapvol";
                    swap.swapfile.size = "8G";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
