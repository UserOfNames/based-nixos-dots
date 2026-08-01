{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system.fish;
in {
  config = lib.mkIf cfg.enable {
    environment = {
      shells = with pkgs; [ fish ];
      pathsToLink = [ "/share/fish" ];
    };

    users.defaultUserShell = pkgs.fish;

    programs.fish = {
      enable = true;
    };
  };
}
