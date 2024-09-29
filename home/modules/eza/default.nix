{ lib, config, ... }:

with lib; let
  cfg = config.modules.eza;
in {
  options.modules.eza = {
    enable = mkEnableOption "eza";
  };

  config = mkIf cfg.enable {
    home.shellAliases."ls" = "eza -la --icons=always";

    programs.eza = {
      enable = true;
    };
  };
}
