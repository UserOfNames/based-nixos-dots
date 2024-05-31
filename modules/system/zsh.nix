{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system.zsh;
in {
  config = lib.mkIf cfg.enable {
    environment = {
      shells = with pkgs; [ zsh ];
      pathsToLink = [ "/share/zsh" ];
    };
    users.defaultUserShell = pkgs.zsh;

    programs.zsh = {
      enable = true;
    };
  };
}
