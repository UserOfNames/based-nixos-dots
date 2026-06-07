{ config, pkgs, lib, ... }:

let
  cfg = config.scripts.fzf-common-dirs;

  osDotsPath = config.myModules.dotsPath;

  sys-utils = pkgs.writeShellApplication {
    name = "sys-utils";

    runtimeInputs = with pkgs; [
      nixos-rebuild
      nix
      coreutils
    ];

    text = ''
      usage="Usage: sys-utils {rebuild|update|updaterb|listpkgs}"

      if [ $# -eq 0 ]; then
        echo "$usage"
        exit 1
      fi

      COMMAND=$1
      shift

      case "$COMMAND" in
        rebuild)
          sudo nixos-rebuild switch --flake "${osDotsPath}"
          ;;
        update)
          sudo nix flake update --flake "${osDotsPath}"
          ;;
        updaterb)
          sudo nix flake update --flake "${osDotsPath}" && \
          sudo nixos-rebuild switch --flake ${osDotsPath}
          ;;
        listpkgs)
          nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq
          ;;
        *)
          echo "Unknown command: $COMMAND"
          echo "$usage"
          exit 1
          ;;
      esac
    '';
  };
in {
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      sys-utils
    ];
  };
}
