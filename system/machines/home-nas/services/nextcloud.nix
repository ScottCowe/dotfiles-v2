{ pkgs, ... }:

{
  name = "nextcloud";
  additionalGroups = [ "shared" ];
  password = "password";
  sudo = false; 
  authorizedSHHKeys = []; 
  extraConfig = {
    config = {
      environment.etc."nextcloud-admin-pass".text = "Password123!"; 
      services.nextcloud = {
        enable = true;
        package = pkgs.nextcloud29;
        hostName = "localhost";
        config.adminpassFile = "/etc/nextcloud-admin-pass";
        settings.trusted_domains = [ "localhost" "192.168.1.2" ];
        maxUploadSize = "1000G";
      };

      systemd.timers."plex-media-to-shared" = {
        wantedBy = [ "timers.target" ];
          timerConfig = {
            OnBootSec = "20m";
            OnUnitActiveSec = "20m";
            Unit = "plex-media-to-shared.service";
          };
      };

      systemd.services."plex-media-to-shared" = {
        script = ''
          set -eu
          ${pkgs.rsync}/bin/rsync -Pcauv --delete /var/lib/nextcloud/data/tv/files/Videos /var/lib/shared/
          ${pkgs.rsync}/bin/rsync -Pcauv --delete /var/lib/nextcloud/data/tv/files/Movies /var/lib/shared/
        '';
        serviceConfig = {
          Type = "oneshot";
          User = "root";
        };
      };
    };
  };
}
