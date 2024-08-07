{ inputs, mkServerService, ... }:

{
  mkServerHost = { hostname, system, stateVersion, pkgs, 
    services, networkInterfaces,
    unfreePackages ? [], extraConfig ? {}, timezone ? "Europe/London", 
    ... }:
  pkgs.lib.nixosSystem {
    modules = [
      {
        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        system.stateVersion = "${stateVersion}";

        networking = {
          hostName = "${hostname}";
          useDHCP = false;
          interfaces = networkInterfaces;

          firewall.allowedTCPPorts = [ 22 ];
          defaultGateway = "192.168.1.1";
          nameservers = [ "8.8.8.8" ];
        };

        timezone = {
          enable = true;
          timezone = "${timezone}";
        };

        services.openssh.enable = true;

        imports = [] ++ (map (s: mkServerService s pkgs) services);
      }

      extraConfig
    ];
  };

  mkServerService = { name, sudo ? false, authorizedSHHKeys ? [], config, ... }: pkgs:
  pkgs.lib.mkMerge [
    { 
      users.users."${name}" = {
        name = name;
        isNormalUser = false;
        isSystemUser = true;
        extraGroups = [] ++ pkgs.lib.mkIf sudo [ "wheel" ];
        initialPassword = "password"; # TODO: Change to initialHashedPassword and use sops
        openssh.authorizedKeys.keys = authorizedSHHKeys;
      };
    }

    config
  ];
}
