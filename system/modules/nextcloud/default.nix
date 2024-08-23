{ lib, config, pkgs, ... }:

with lib; {
  options.nextcloud = {
    enable = mkEnableOption "nextcloud";
    adminPass = mkOption {
      type = types.str;
      example = "Password123!";
      description = ''
        Default password for nextcloud
        Must follow nextcloud password requirements
      '';
    };
  };

  config = mkIf config.nextcloud.enable {
    environment.etc."nextcloud-admin-pass".text = "${config.nextcloud.adminPass}"; 
    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud29;
      hostName = "localhost";
      config.adminpassFile = "/etc/nextcloud-admin-pass";
      settings.trusted_domains = [ "localhost" "192.168.1.2" ];
      maxUploadSize = "1000G";
    };
  };
}
