{ lib, config, ... }:

with lib; {
  options.timezone = {
    enable = mkEnableOption "timezone";
  };

  config = mkIf config.timezone.enable {
    services.automatic-timezoned.enable = true;
    services.geoclue2 = {
      enable = true;
      geoProviderUrl = "https://beacondb.net/v1/geolocate?key=geoclue";
    };
  };
}
