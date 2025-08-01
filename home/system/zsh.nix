{ config, lib, ... }:

let
  cfg = config.myHomeModules.system.zsh;
  dotDir = "${config.home.homeDirectory}/.config/zsh";
in {
  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      autocd = true;
      inherit dotDir;

      history = {
        path = "${dotDir}/.zsh_history";
        ignoreSpace = true;
      };

      dirHashes = {
        docs = "$HOME/Documents";
        dots = "$HOME/.nixosdots";
        desk = "$HOME/Desktop";
        down = "$HOME/Downloads";
        mus  = "$HOME/Music";
        pics = "$HOME/Pictures";
        proj = "$HOME/Projects";
        vids = "$HOME/Videos";
        ytdl = "$HOME/YTDLP";
      };

      shellAliases = {
        ls = "ls -a --color";
        c = "clear";
        clearall = "clear && rm $ZDOTDIR/.zsh_history";

        rebuild = "sudo nixos-rebuild switch --flake ~/.nixosdots";
        update = "sudo nix flake update --flake ~/.nixosdots";
        updaterb = "sudo nix flake update --flake ~/.nixosdots && sudo nixos-rebuild switch --flake ~/.nixosdots";
        listpkgs = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq";
      };

      # Default keys didn't work so set alternate up/down keys
      historySubstringSearch = {
        enable = true;
        searchUpKey = "$terminfo[kcuu1]";
        searchDownKey = "$terminfo[kcud1]";
      };

      initContent = ''
        PS1="%F{magenta}[%f%F{green}%n%f%F{magenta}@%f%F{cyan}%m%f %F{magenta}%~]%% %f"
        bindkey -v
        keytimeout=1

        setopt correct
        setopt INC_APPEND_HISTORY
        setopt HIST_FIND_NO_DUPS

        zstyle ':completion:*' menu select
        _comp_options+=(globdots)

        bindkey -s "^[s" " nix develop -c zsh\n"

        # <C-z> toggles suspend
        fancy-ctrl-z () {
          if [[ $#BUFFER -eq 0 ]]; then
            BUFFER=" fg"
            zle accept-line -w
          else
            zle push-input -w
            zle clear-screen -w
          fi
        }
        zle -N fancy-ctrl-z
        bindkey "^Z" fancy-ctrl-z
      '';
    }; 
  };
}

