{ config, pkgs, ... }:

{
  security = {
    # Sudo configuration (show password feedback)
    sudo = {
      extraConfig = ''
        Defaults pwfeedback
      '';
    };
  };
}
