{ lib, config, ... }:

with lib; {
  options.eza = {
    enable = mkEnableOption "eza";
  };

  config = mkIf config.eza.enable {
    home.shellAliases."ls" = "eza -la --icons=always";

    programs.eza = {
      enable = true;
    };
  };
}
