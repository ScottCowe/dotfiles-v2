{ lib, config, ... }:

with lib; {
  options.timezone = {
    enable = mkEnableOption "timezone";
    automatic = mkEnableOption "automatic";
    zone = mkOption {
      default = "Etc/UTC";
      type = types.str;
      example = "Europe/London";
      description = ''
        The time zone used when displaying times and dates. See <https://en.wikipedia.org/wiki/List_of_tz_database_time_zones>
        for a comprehensive list of possible values for this setting.

        If null, the timezone will default to UTC and can be set imperatively
        using timedatectl.
      '';
    };
  };

  config = mkIf config.timezone.enable {
    time.timeZone = config.timezone.zone;

    services = mkIf config.timezone.automatic {
      automatic-timezoned.enable = true;
      geoclue2 = {
        enable = true;
        # TODO: Get this working
        geoProviderUrl = "https://beacondb.net/v1/geolocate?key=geoclue";
      };
    };
  };
}
