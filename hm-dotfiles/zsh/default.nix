{ config, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;

    dirHashes = {
      dots = "$HOME/.nixosdots";
    };

    historySubstringSearch = {
      enable = true;
      searchUpKey = "$terminfo[kcuu1]";
      searchDownKey = "$terminfo[kcud1]";
    };

    initExtra = ''
      PS1="%F{magenta}[%f%F{green}%n%f%F{magenta}@%f%F{cyan}%m%f %F{magenta}%~]%% %f"
      setopt correct
      bindkey -v
      keytimeout=1
      zstyle ':completion:*' menu select
      _comp_options+=(globdots)
    '';
  }; 
}

