{ lib, config, ... }:

with lib; let
  cfg = config.modules.easyeffects;
in {
  options.modules.easyeffects = {
    enable = mkEnableOption "easyeffects";
  };

  config = mkIf cfg.enable {
    services.easyeffects.enable = true; 
  };
}
