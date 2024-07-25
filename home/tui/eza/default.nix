{ lib, config, ... }:

with lib; {
  options.tui.eza = {
    enable = mkEnableOption "eza";
  };

  config = mkIf config.tui.eza.enable {
    home.shellAliases."ls" = "eza -la --icons=always";

    programs.eza = {
      enable = true;
    };
  };
}
