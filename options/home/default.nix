{ myLib, ... }:

{
  imports = [] ++ (myLib.importFilesIn ./.);
}
