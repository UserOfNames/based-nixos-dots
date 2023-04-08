{ config, pkgs, nur,  ... }:

{
  programs.firefox = {
    enable = true;

    profiles = {
      default = {
        isDefault = true;

#        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
#          ublock-origin
#          clearurls
#        ];
        settings = {
        };
      };
    };
  };
}
