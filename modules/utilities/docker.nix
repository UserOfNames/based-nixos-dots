{ config, lib, ... }:

let
  cfg = config.myModules.utilities.docker;
  userName = config.myModules.system.mainUser.userName;
in {
  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
    };

    users.users.${userName}.extraGroups = [ "docker" ];
  };
}
