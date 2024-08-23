{
  name = "nextcloud";
  password = "password";
  sudo = false; 
  authorizedSHHKeys = []; 
  extraConfig = {
    imports = [ ../../../modules ];

    config.nextcloud = {
      enable = true;
      adminPass = "Password123!";
    };
  };
}
