{ config, pkgs, lib, ... }:

{
  options = {
    myModules.system.zsh.enable = lib.mkEnableOption "Enable zsh module";
  };

  config = lib.mkIf config.myModules.system.zsh.enable {
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
