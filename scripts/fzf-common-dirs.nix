{ config, pkgs, lib, inputs, ... }:

let
  cfg = config.scripts.fzf-common-dirs;
  userName = config.myModules.system.mainUser.userName;

  targets = config.scripts.fzf-common-dirs.targets;
  pathStrs = lib.concatStringsSep " " targets;
in {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  options.scripts.fzf-common-dirs.targets = lib.mkOption {
    type = lib.types.listOf lib.types.path;
    description = "Base paths to search";
  };

config = lib.mkIf cfg.enable {
    home-manager.users."${userName}".programs.zsh.initContent = ''
      fzf-common-dirs-widget() {
        local selected
        selected=$(${pkgs.findutils}/bin/find ${pathStrs} \( -name .git -o -name .stversions -o -name .stfolder -o -name target \) -prune -o -type d -print | ${pkgs.fzf}/bin/fzf)

        if [ -n "$selected" ]; then
          cd "$selected"
          # 2. Crucial: redraw the prompt so the new directory path shows up immediately
          zle reset-prompt
        fi
      }

      zle -N fzf-common-dirs-widget

      bindkey "^f" fzf-common-dirs-widget
    '';
  };
}
