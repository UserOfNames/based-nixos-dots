{ myLib, ... }:

{
  imports = [] ++ (myLib.importHelper ./.);
}
