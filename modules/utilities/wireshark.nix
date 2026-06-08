{ config, lib, pkgs, ... }:

let
  cfg = config.myModules.utilities.wireshark;
  userName = config.myModules.system.mainUser.userName;
in {
  config = lib.mkIf cfg.enable {
    programs.wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };

    users.users.${userName}.extraGroups = [ "wireshark" ];
  };
}
