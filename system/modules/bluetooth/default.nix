{ lib, config, ... }:

with lib; {
  options.bluetooth = {
    enable = mkEnableOption "bluetooth";
  };

  config = mkIf config.bluetooth.enable {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true; 

    services.blueman.enable = true;
  };
}
