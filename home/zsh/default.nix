{ config, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;

    # Directory shortcuts - shortcut = directory
    dirHashes = {
      dots = "$HOME/.nixosdots";
      desk = "$HOME/Desktop";
      proj = "$HOME/projects";
      ytdlp = "$HOME/YTDLP";
    };

    # Default keys didn't work, set alternate up/down keys
    historySubstringSearch = {
      enable = true;
      searchUpKey = "$terminfo[kcuu1]";
      searchDownKey = "$terminfo[kcud1]";
    };

    # Extra configs to append
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

