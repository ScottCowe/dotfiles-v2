{
  name = "plex";
  additionalGroups = [ "shared" ];
  password = "password";
  sudo = false; 
  systemUser = true;
  authorizedSHHKeys = [ ]; 
  extraConfig = {
    services.plex = {
      enable = true;
      openFirewall = true;
    };
  };
}
