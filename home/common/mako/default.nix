{ lib, config, inputs, ... }:

with lib; {
  options.common.mako = { 
    enable = mkEnableOption "mako"; 
  };

  config = mkIf config.common.mako.enable {
    services.mako = {
      enable = true;
      defaultTimeout = 5000;
    };
  };
}
