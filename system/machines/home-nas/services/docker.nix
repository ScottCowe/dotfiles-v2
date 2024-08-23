{
  name = "docker";
  password = "password";
  sudo = false; 
  authorizedSHHKeys = []; 
  extraConfig = {
    imports = [ ../../../modules ];

    config.podman.enable = true;
    config.podman.nvidiaSupport = true;
    config.podman.zshSupport = true;
  };
}
