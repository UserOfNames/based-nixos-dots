{ config, pkgs, lib, ... }:

{
  options = {
    myModules.zsh.enable = lib.mkEnableOption "Enable zsh module";
  };

  config = lib.mkIf config.myModules.zsh.enable {
    # More zsh options in home-manager zsh.nix
    environment = {
      shells = with pkgs; [ zsh ];
    };
    users.defaultUserShell = pkgs.zsh;

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      setOptions = [
        "INC_APPEND_HISTORY"
        "HIST_FIND_NO_DUPS"
      ];

      shellAliases = {
        ls = "ls -a --color";
        c = "clear";
        clearall = "clear && rm ~/.zsh_history";

        rebuild = "sudo nixos-rebuild switch --flake ~/.nixosdots";
        update = "sudo nix flake update ~/.nixosdots";
        updaterb = "sudo nix flake update ~/.nixosdots && sudo nixos-rebuild switch --flake ~/.nixosdots";
        listpkgs = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq";
      };
    };
  };
}
