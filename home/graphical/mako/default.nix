{ lib, config, inputs, ... }:

with lib; {
  options.graphical.mako = { 
    enable = mkEnableOption "mako"; 
  };

  config = mkIf config.graphical.mako.enable {
    services.mako = {
      enable = true;
      defaultTimeout = 5000;
    };
  };
}
