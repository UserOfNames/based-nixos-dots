{ config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
    initExtra = ''
      PS1="%F{magenta}[%f%F{green}%n%f%F{magenta}@%f%F{cyan}%m%f %F{magenta}%~]%% %f"
      setopt correct
      bindkey -v
      keytimeout=1
      zstyle ':completion:*' menu select
      _comp_options+=(globdots)
      setopt INC_APPEND_HISTORY
      setopt HIST_FIND_NO_DUPS
    '';

    shellAliases = {
      ls = "ls -a --color";
      c = "clear";
      clearall = "clear && rm ~/.zsh_history";
    };
  }; 
}
