{ lib, config, pkgs, ... }:

with lib; {
  options.podman = {
    enable = mkEnableOption "podman";
    nvidiaSupport = mkEnableOption "nvidiaSupport";
    zshSupport = mkEnableOption "zshSupport";
  };

  config = mkIf config.podman.enable {
    hardware.nvidia-container-toolkit.enable = config.podman.nvidiaSupport;

    environment.systemPackages = with pkgs; [ slirp4netns ];

    environment.extraInit = ''
      export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
    '';

    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
      extraPackages = if config.podman.zshSupport then [ pkgs.zfs ] else [ ];
      defaultNetwork.settings = {
        dns_enabled = true;
      };
    };

    virtualisation.oci-containers = {
      backend = "podman";
    };

    virtualisation.containers = {
      enable = true;
    };
  };
}
