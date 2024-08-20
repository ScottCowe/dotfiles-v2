{
  name = "nextcloud";
  password = "password";
  sudo = false; 
  authorizedSHHKeys = []; 
  extraConfig = {
    imports = [ ../../../nixos ];

    config.nextcloud = {
      enable = true;
      adminPass = "Password123!";
    };
  };
}
