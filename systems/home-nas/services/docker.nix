{ ... }:

{
  name = "docker";
  sudo = true; 
  authorizedSHHKeys = []; 
  extraConfig = {
    imports = [ ../../../nixos ];

    config.podman.enable = true;
    config.podman.nvidiaSupport = true;
    config.podman.zshSupport = true;
  };
}
