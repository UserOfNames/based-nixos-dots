{ config, pkgs, lib, inputs, ... }:

let
  cfg = config.myUtils.fzf-common-dirs;
  userName = config.myModules.system.mainUser.userName;

  targets = config.myUtils.fzf-common-dirs.targets;
  pathStrs = lib.concatStringsSep " " targets;
in {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  options.myUtils.fzf-common-dirs.targets = lib.mkOption {
    type = lib.types.listOf lib.types.path;
    description = "Base paths to search";
  };

config = lib.mkIf cfg.enable {
    # TODO: Unprincipled manipulation of home-manager, remove later
    # TODO: Tightly coupled to fish, fix later
    home-manager.users."${userName}".programs.fish = {
      functions = {
        fzf-common-dirs = {
          body = ''
            set -l selected (${pkgs.findutils}/bin/find ${pathStrs} \( -name .git -o -name .stversions -o -name .stfolder -o -name target \) -prune -o -type d -print | ${pkgs.fzf}/bin/fzf)

            if test -n "$selected"
              cd "$selected"
            end
            
            commandline -f repaint
          '';
        };
      };

      binds = {
        "ctrl-f" = {
          command = "fzf-common-dirs";
          mode = "insert";
        };
      };
    };
  };
}
