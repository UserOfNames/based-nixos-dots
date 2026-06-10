{ config, lib, ... }:

let
  cfg = config.myHomeModules.utilities.sshAgent;
in {
  config = lib.mkIf cfg.enable {
    services.ssh-agent.enable = true;
  };
}
