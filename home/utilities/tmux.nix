{ config, pkgs, lib, ... }:

{
  options = {
    myHomeModules.tmux.enable = lib.mkEnableOption "Enable tmux user configuration";
  };

  config = lib.mkIf config.myHomeModules.tmux.enable {
    programs.tmux = {
      enable = true;
      escapeTime = 0;
      keyMode = "vi";
      clock24 = true;

      extraConfig = ''
        bind-key -r ^ last-window
        bind-key -r k select-pane -U
        bind-key -r j select-pane -D
        bind-key -r h select-pane -L
        bind-key -r l select-pane -R
        bind-key -r K resize-pane -U
        bind-key -r J resize-pane -D
        bind-key -r H resize-pane -L
        bind-key -r L resize-pane -R
      '';
    };
  };
}
