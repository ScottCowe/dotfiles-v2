{ lib, config, ... }:

with lib; {
  options.common.eza = {
    enable = mkEnableOption "eza";
  };

  config = mkIf config.common.eza.enable {
    home.shellAliases."ls" = "eza -la --icons=always";

    programs.eza = {
      enable = true;
    };
  };
}
