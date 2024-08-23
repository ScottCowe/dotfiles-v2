{ inputs, mkServerService, ... }:

{
  mkServerHost = { hostname, hostId, system, stateVersion, pkgs, lib,
    services, networkInterfaces,
    unfreePackages ? [], extraConfig ? {}, timezone ? "Europe/London"
  }:
  lib.nixosSystem {
    modules = [
      {
        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) unfreePackages;

        system.stateVersion = "${stateVersion}";

        boot.loader.grub = {
          enable = true;
          zfsSupport = true;
          efiSupport = true;
          efiInstallAsRemovable = true;
          mirroredBoots = [
            { devices = [ "nodev" ]; path = "/boot"; }
          ];
          configurationLimit = 10;
        };

        networking = {
          hostName = "${hostname}";
          hostId = "${hostId}";
          useDHCP = false;
          interfaces = networkInterfaces;

          firewall.allowedTCPPorts = [ 22 80 443 ];
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

        nix.gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 1w";
        }; 

        nix.settings.auto-optimise-store = true;

        imports = [] ++ (map (s: mkServerService s pkgs lib) services);
      }

      extraConfig

      ../system/machines/${hostname}/hardware-configuration.nix
    ];
  };

  mkServerService = { name, password, sudo ? false, systemUser ? true, authorizedSHHKeys ? [], extraConfig ? {} }: pkgs: lib:
  { 
    imports = [ extraConfig ];

    users.groups."${name}" = lib.mkIf systemUser {};

    users.users."${name}" = {
      name = name;
      group = lib.mkIf systemUser "${name}";
      isNormalUser = !systemUser;
      isSystemUser = systemUser;
      extraGroups = [ ] ++ (if sudo then [ "wheel" ] else []);
      initialPassword = "${password}";
      openssh.authorizedKeys.keys = authorizedSHHKeys;
    };
  };
}
