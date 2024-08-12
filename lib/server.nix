{ inputs, mkServerService, ... }:

{
  mkServerHost = { hostname, hostId, system, stateVersion, nixpkgs, 
    services, networkInterfaces,
    unfreePackages ? [], extraConfig ? {}, timezone ? "Europe/London"
  }:
  nixpkgs.lib.nixosSystem {
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
            { devices = [ "nodev" ]; path = "/boot"; }
          ];
        };

        networking = {
          hostName = "${hostname}";
          hostId = "${hostId}";
          useDHCP = false;
          interfaces = networkInterfaces;

          firewall.allowedTCPPorts = [ 22 ];
          defaultGateway = "192.168.1.1";
          nameservers = [ "8.8.8.8" ];
        };

        time.timeZone = timezone;

        services.openssh = {
          enable = true;

          settings = {
            PasswordAuthentication = false;
            KbdInteractiveAuthentication = false;
            PermitRootLogin = "no";
          };
        };

        imports = [] ++ (map (s: mkServerService s nixpkgs) services);
      }

      extraConfig

      ../systems/${hostname}/hardware-configuration.nix
    ];
  };

  mkServerService = { name, sudo ? false, authorizedSHHKeys ? [], extraConfig, ... }: nixpkgs:
  { 
    imports = [ extraConfig ];

    users.users."${name}" = {
      name = name;
      isNormalUser = true;
      isSystemUser = false;
      # extraGroups = [] ++ nixpkgs.lib.mkIf sudo [ "wheel" ];
      extraGroups = [ ] ++ (if sudo then [ "wheel" ] else []);
      initialPassword = "password"; # TODO: Change to initialHashedPassword and use sops
      openssh.authorizedKeys.keys = authorizedSHHKeys;
    };
  };
}
