{ inputs, pkgs, lib, config, ... }:

with lib; let
  cfg = config.graphical.prismlauncher; 
in {
  options.graphical.prismlauncher = { 
    enable = mkEnableOption "PrismLauncher";

    package = mkOption {
      type = types.package;
      default = pkgs.prismlauncher;
      defaultText = literalExpression "pkgs.prismlauncher";
      description = "The PrismLauncher package to install.";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      config.graphical.prismlauncher.package
      mangohud
    ];
  };
}
