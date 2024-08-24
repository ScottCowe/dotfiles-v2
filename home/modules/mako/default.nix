{ lib, config, ... }:

with lib; {
  options.mako = { 
    enable = mkEnableOption "mako"; 
  };

  config = mkIf config.mako.enable {
    services.mako = {
      enable = true;
      defaultTimeout = 5000;
    };
  };
}
