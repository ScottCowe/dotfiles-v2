{ lib, config, ... }:

with lib; {
  options.graphical.easyeffects = {
    enable = mkEnableOption "easyeffects";
  };

  config = mkIf config.graphical.easyeffects.enable {
    services.easyeffects.enable = true; 
  };
}
