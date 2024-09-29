{ lib, config, pkgs, ... }:

with lib; let
  cfg = config.modules.rstudio;
in {
  options.modules.rstudio = {
    enable = mkEnableOption "rstudio";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ rstudio ];
  };
}
