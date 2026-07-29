{ lib }:

{
  # Wrap a binary with runtime dependencies and environment variables
  mkWrappedBinary = {
    pkgs,
    binPath,
    outName,
    envVars ? {},
    runtimePkgs ? []
  }:
    let
      envArgs = lib.concatStringsSep
        " "
        (lib.mapAttrsToList
          (k: v: "--set ${lib.escapeShellArg k} ${lib.escapeShellArg (toString v)}")
          envVars);

      pathArg = lib.optionalString (runtimePkgs != [])
        "--prefix PATH : ${lib.makeBinPath runtimePkgs}";
    in
      pkgs.runCommand
        outName
        {
          nativeBuildInputs = [ pkgs.makeWrapper ];
        }
        ''
          mkdir -p $out/bin
          
          # Pull the specific binary from the given package and wrap it
          makeWrapper ${binPath} $out/bin/${outName} \
            ${envArgs} \
            ${pathArg}
        '';
}
