{ config, lib, ... }:

{
  options = {
    myHomeModules.zsh.enable = lib.mkEnableOption "Enable zsh module";
  };

  config = lib.mkIf config.myHomeModules.zsh.enable {
    programs.zsh = {
      enable = true;
      autocd = true;

      # Directory shortcuts - shortcut = directory
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
  };
}

