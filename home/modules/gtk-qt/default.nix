{ lib, config, inputs, pkgs, ... }:

with lib; let
  cfg = config.modules.gtk-qt;
  inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) gtkThemeFromScheme;
in {
  options.modules.gtk-qt = {
    enable = mkEnableOption "gtk-qt";
  };

  config = mkIf cfg.enable {  
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
