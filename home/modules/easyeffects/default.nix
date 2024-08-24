{ lib, config, ... }:

with lib; {
  options.easyeffects = {
    enable = mkEnableOption "easyeffects";
  };

  config = mkIf config.easyeffects.enable {
    services.easyeffects.enable = true; 
  };
}
