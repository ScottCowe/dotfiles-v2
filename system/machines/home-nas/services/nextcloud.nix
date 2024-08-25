{ pkgs, ... }:

{
  name = "nextcloud";
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
    };
  };
}
