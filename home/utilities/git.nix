{ config, ... }:

{
  programs.git = {
    enable = true;
    userName = "UserOfNames";
    userEmail = "lightninguy.yoyo@gmail.com";
  };
}
