{ lib, config, ... }:

with lib; let
  cfg = config.modules.mako;
in {
  options.modules.mako = { 
    enable = mkEnableOption "mako"; 
  };

  config = mkIf cfg.enable {
    services.mako = {
      enable = true;
      defaultTimeout = 5000;
    };
  };
}
