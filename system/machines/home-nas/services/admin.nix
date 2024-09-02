{
  name = "admin";
  additionalGroups = [ "shared" ];
  password = "password";
  sudo = true; 
  systemUser = false;
  authorizedSHHKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHGcQvza/UW+16sKmIZEurCSpnmTfkMAAz5eOA0eIrAF cowe@desktop"
  ]; 
  extraConfig = {
    users.groups."shared" = {};
  };
}
