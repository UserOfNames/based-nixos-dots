{ config, pkgs, lib, inputs, ... }:

# Script by ThePrimeagen. Bugfix from https://github.com/ThePrimeagen/.dotfiles/issues/32#issuecomment-1359249250
let
  cfg = config.scripts.tmux-sessionizer;
  userName = config.myModules.system.mainUser.userName;

  tmux-sessionizer = pkgs.writeShellScriptBin "tmux-sessionizer" ''
    if [[ $# -eq 1 ]]; then
        selected=$1
    else
        selected=$(find ~/Projects ~/Documents ~/.nixosdots \( -name .git -prune \) -o -type d -print | ${pkgs.fzf}/bin/fzf)
    fi

    if [[ -z $selected ]]; then
        exit 0
    fi

    selected_name=$(basename "$selected" | tr . _)
    tmux_running=$(pgrep tmux)

    if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
        tmux new-session -s $selected_name -c $selected
        exit 0
    fi

    if ! tmux has-session -t=$selected_name 2> /dev/null; then
        tmux new-session -ds $selected_name -c $selected
    fi

    if [[ -z $TMUX ]]; then
        tmux attach-session -t $selected_name
    else
        tmux switch-client -t $selected_name
    fi
  '';

in {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      tmux-sessionizer
    ];

    home-manager.users."${userName}".programs.zsh.initContent = ''bindkey -s "^[f" " tmux-sessionizer\n"'';
  };
}
