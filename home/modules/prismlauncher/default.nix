{ pkgs, lib, config, ... }:

with lib; let
  cfg = config.modules.prismlauncher; 
in {
  options.modules.prismlauncher = { 
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
      cfg.package
      mangohud
    ];
  };
}
