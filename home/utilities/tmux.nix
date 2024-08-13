{ config, lib, ... }:

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

        bind-key r source-file $HOME/.config/tmux/tmux.conf

        set -g status-position top
        set -g status-justify left
        set -g status-left ""
        set -g status-right "%m-%d-%Y %H:%M "
        set -g status-left-length 10
        set -g status-right-length 50
        set -g status-style "bg=color0"

        setw -g window-status-current-style "fg=color2 bold"
        setw -g window-status-current-format " #I #[fg=color2]#W #F "

        setw -g window-status-style "fg=color7 dim"
        setw -g window-status-format " #I #W #F "
      '';
    };
  };
}
