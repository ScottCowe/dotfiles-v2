{
  name = "docker";
  password = "password";
  sudo = false; 
  authorizedSHHKeys = []; 
  extraConfig = {
    imports = [ ../../../nixos ];

    config.podman.enable = true;
    config.podman.nvidiaSupport = true;
    config.podman.zshSupport = true;
  };
}
