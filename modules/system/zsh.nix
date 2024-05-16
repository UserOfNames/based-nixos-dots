{ config, pkgs, lib, ... }:

{
  options = {
    myModules.zsh.enable = lib.mkEnableOption "Enable zsh module";
  };

  config = lib.mkIf config.myModules.zsh.enable {
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
