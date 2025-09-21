{ config, pkgs, lib, inputs, ... }:

let
  cfg = config.scripts.fzf-common-shells;
  userName = config.myModules.system.mainUser.userName;
  dotsPath = config.myModules.dotsPath;

  fzf-common-shells = pkgs.writeShellScriptBin "fzf-common-shells" ''
    selected=$(find ~/Projects ~/Documents ${dotsPath} \( -name .git -prune \) -o -type d -print | ${pkgs.fzf}/bin/fzf)

    if [[ ! -z $selected ]]; then
        cd $selected
    fi
  '';
in {
  # imports = [ inputs.home-manager.nixosModules.home-manager ];
  #
  # config = lib.mkIf cfg.enable {
  #   environment.systemPackages = [
  #     fzf-common-shells
  #   ];
  #
  #   home-manager.users."${userName}".programs.zsh.initContent = ''bindkey -s "^f" " source fzf-common-shells\n"'';
  # };
}
