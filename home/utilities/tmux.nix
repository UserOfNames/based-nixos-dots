{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.tmux;
in {
  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      shortcut = "Space";
      keyMode = "vi";
      escapeTime = 0;
      baseIndex = 1;
      mouse = true;
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

        set -g status-position top
      '';
    };
  };
}
