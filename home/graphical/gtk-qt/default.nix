{ lib, config, inputs, pkgs, ... }:

with lib; let
  inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) gtkThemeFromScheme;
in {
  options.graphical.gtk-qt = {
    enable = mkEnableOption "gtk-qt";
  };

  config = mkIf config.graphical.gtk-qt.enable {  
    gtk = {
      enable = true;

      theme = {
        name = "Materia";
        package = pkgs.materia-theme;
      };
      
      # theme = {
      #   name = "${config.colorScheme.name}";
      #   package = gtkThemeFromScheme { scheme = config.colorScheme; };
      # };

      gtk3 = {
        extraConfig = {
          gtk-application-prefer-dark-theme = true;
        };
      };
    };
  };
}
