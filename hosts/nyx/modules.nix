{ ... }:

{
  myModules = {
    system = {
      enable = true;
      mainUser.userName = "zdbg";
      hardware = {
        bluetooth.enable = true;
      };
      display = {
        hyprland.enable = false;
        plasma.enable = true;
      };
    };

    other = {
      enable = true;
    };

    utilities = {
      enable = true;
      virtualization.enable = true;
    };
  };

  myHomeModules = {
    other = {
      enable = true;
    };

    productivity = {
      enable = true;
    };

    system = {
      enable = true;
      hyprland.enable = false;
    };

    utilities = {
      enable = true;
      syncthing.enable = true;
    };
  };
}
