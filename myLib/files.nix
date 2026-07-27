{ lib, ... }:

rec {
  # Get the name of a file
  fileName = path:
    builtins.head (builtins.split "\\." (baseNameOf path));

  # Get a list of filenames in a directory
  fileNamesIn = dir:
    builtins.attrNames (builtins.readDir dir);

  # Get a list of files in a directory
  filesIn = dir:
    map (filename: dir + "/${filename}") (fileNamesIn dir);

  # Get a list of files in a directory except default.nix
  # Importing default.nix into itself causes infinite recursion,
  # so use this for imports instead of plain filesIn
  importFilesIn = dir:
    lib.lists.remove (dir + "/default.nix") (filesIn dir);
}
