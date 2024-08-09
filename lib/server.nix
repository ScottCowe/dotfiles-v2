{ inputs, mkServerService, ... }:

{
  mkServerHost = { hostname, hostId, system, stateVersion, pkgs, 
    services, networkInterfaces,
    unfreePackages ? [], extraConfig ? {}, timezone ? "Europe/London", 
    ... }:
  pkgs.lib.nixosSystem {
    modules = [
      {
        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        system.stateVersion = "${stateVersion}";

        boot.loader.grub = {
          enable = true;
          zfsSupport = true;
          efiSupport = true;
          efiInstallAsRemovable = true;
          mirroredBoots = [
            { devices = [ "nodev"]; path = "/boot"; }
          ];
        };

        # networking = {
        #   hostName = "${hostname}";
        #   useDHCP = false;
        #   interfaces = networkInterfaces;
        #
        #   firewall.allowedTCPPorts = [ 22 ];
        #   defaultGateway = "192.168.1.1";
        #   nameservers = [ "8.8.8.8" ];
        # };

        networking = {
          hostName = "${hostname}";
          hostId = "${hostId}";
        };

        time.timeZone = timezone;

        services.openssh.enable = true;

        imports = [] ++ (map (s: mkServerService s pkgs) services);
      }

      extraConfig

      ../systems/${hostname}/configuration.nix
      ../systems/${hostname}/hardware-configuration.nix
    ];
  };

  mkServerService = { name, sudo ? false, authorizedSHHKeys ? [], extraConfig, ... }: pkgs:
  { 
    imports = [ extraConfig ];

    users.users."${name}" = {
      name = name;
      isNormalUser = true;
      isSystemUser = false;
      # extraGroups = [] ++ pkgs.lib.mkIf sudo [ "wheel" ];
      extraGroups = [ "wheel" ];
      initialPassword = "password"; # TODO: Change to initialHashedPassword and use sops
      openssh.authorizedKeys.keys = authorizedSHHKeys;
    };
  };
}