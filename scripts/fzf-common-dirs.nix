{ config, pkgs, lib, inputs, ... }:

let
  cfg = config.scripts.fzf-common-dirs;
  userName = config.myModules.system.mainUser.userName;

  fzf-common-dirs = pkgs.writeShellScriptBin "fzf-common-dirs" ''
    selected=$(find ~/Projects ~/Documents ~/.nixosdots \( -name .git -prune \) -o -type d -print | ${pkgs.fzf}/bin/fzf)

    if [[ ! -z $selected ]]; then
        cd $selected
    fi
  '';
in {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      fzf-common-dirs
    ];

    home-manager.users."${userName}".programs.zsh.initContent = ''bindkey -s "^f" " source fzf-common-dirs\n"'';
  };
}
