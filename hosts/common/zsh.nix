{ config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    # setopt lines, other configs are in home-manager zsh.nix
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
    };
  };

}
