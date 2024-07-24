{ lib, config, inputs, pkgs, ... }:

with lib; let
  inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) gtkThemeFromScheme;
in {
  options.graphical.gtk = {
    enable = mkEnableOption "gtk";
  };

  config = mkIf config.graphical.gtk.enable {
    gtk = {
      enable = true;

      theme = {
        name = "${config.colorScheme.name}";
        package = gtkThemeFromScheme { scheme = config.colorScheme; };
      };
    };
  };
}
