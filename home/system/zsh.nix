{ config, lib, ... }:

{
  options = {
    myHomeModules.system.zsh.enable = lib.mkEnableOption "Enable zsh user configuration";
  };

  config = lib.mkIf config.myHomeModules.system.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      autocd = true;

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
        clearall = "clear && rm ~/.zsh_history";
        sc = "cd `hash -d | bemenu | sed 's/^.*=//'`";
        scl = "lf `hash -d | bemenu | sed 's/^.*=//'`";

        rebuild = "sudo nixos-rebuild switch --flake ~/.nixosdots";
        update = "sudo nix flake update ~/.nixosdots";
        updaterb = "sudo nix flake update ~/.nixosdots && sudo nixos-rebuild switch --flake ~/.nixosdots";
        listpkgs = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq";
      };

      # Default keys didn't work so set alternate up/down keys
      historySubstringSearch = {
        enable = true;
        searchUpKey = "$terminfo[kcuu1]";
        searchDownKey = "$terminfo[kcud1]";
      };

      initExtra = ''
        PS1="%F{magenta}[%f%F{green}%n%f%F{magenta}@%f%F{cyan}%m%f %F{magenta}%~]%% %f"
        setopt correct
        setopt INC_APPEND_HISTORY
        setopt HIST_FIND_NO_DUPS
        bindkey -v
        keytimeout=1
        zstyle ':completion:*' menu select
        _comp_options+=(globdots)
      '';
    }; 
  };
}

