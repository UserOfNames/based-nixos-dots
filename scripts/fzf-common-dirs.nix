{ config, pkgs, lib, inputs, ... }:

let
  cfg = config.scripts.fzf-common-dirs;
  userName = config.myModules.system.mainUser.userName;

  targets = config.scripts.fzf-common-dirs.targets;
  pathStrs = lib.concatStringsSep " " targets;

  fzf-common-dirs = pkgs.writeShellScriptBin "fzf-common-dirs" ''
    selected=$(find ${pathStrs} \( -name .git -prune \) -o -type d -print | ${pkgs.fzf}/bin/fzf)

    if [[ ! -z $selected ]]; then
        cd $selected
    fi
  '';
in {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  options.scripts.fzf-common-dirs.targets = lib.mkOption {
    type = lib.types.listOf lib.types.path;
    description = "Base paths to search";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      fzf-common-dirs
    ];

    home-manager.users."${userName}".programs.zsh.initContent = ''bindkey -s "^f" " source fzf-common-dirs\n"'';
  };
}
