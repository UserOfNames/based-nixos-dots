{ config, pkgs, lib, inputs, ... }:

let
  cfg = config.scripts.fzf-cd-common;
  cfgZsh = config.myHomeModules.system.zsh;
  userName = config.myModules.system.user.userName;

  fzf-cd-common = pkgs.writeShellScriptBin "fzf-cd-common" ''
    selected=$(find ~/Projects ~/Documents ~/.nixosdots \( -name .git -prune \) -o -type d -print | ${pkgs.fzf}/bin/fzf)

    if [[ ! -z $selected ]]; then
        cd $selected
    fi
  '';
in {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      fzf-cd-common
    ];

    home-manager.users."${userName}".programs.zsh.initExtra = lib.mkIf cfgZsh.enable ''bindkey -s "^f" " source fzf-cd-common\n"'';
  };
}
