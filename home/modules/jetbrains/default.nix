{ lib, config, pkgs, ... }:

with lib; let
  cfg = config.modules.jetbrains;
in {
  options.modules.jetbrains = {
    idea = {
      enable = mkEnableOption "enable";
    };
  };

  config = {
    home.packages = mkIf cfg.idea.enable [ (pkgs.symlinkJoin {
      name = "idea-community";
      paths = [ pkgs.jetbrains.idea-community ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/idea-community \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [pkgs.libpulseaudio pkgs.libGL pkgs.glfw pkgs.openal pkgs.stdenv.cc.cc.lib]}"
      '';
    }) ]; 
  };
}
