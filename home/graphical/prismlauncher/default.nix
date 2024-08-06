{ pkgs, lib, config, ... }:

with lib; {
  options.graphical.prismlauncher = { 
    enable = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = mdDoc ''
        Whether to enable prismlauncher 
      '';
    };

    theme = mkOption {
      type = types.nullOr types.path;
      default = null;
      example = literalExpression "some derivation";
      description = mdDoc ''
        What theme to use
      '';
    };
  };

  config = mkIf config.graphical.prismlauncher.enable {
    home.packages = with pkgs; [
      (prismlauncher.override {
        jdks = [ jdk21 jdk17 jdk8 ];
        additionalPrograms = [ alsa-oss ];
      })
    ];

    # home.file.".local/share/PrismLauncher/themes/Catppuccin-Mocha".source = config.gaming.prismlauncher.theme;
  };
}
