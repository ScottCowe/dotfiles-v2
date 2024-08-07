{ lib, inputs, ... }:

{
  mkISOSystem = { system, ... }:
  lib.nixosSystem {
    modules = [
      "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"

      {
        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        networking = {
          useDHCP = false;
          interfaces = {
            enp4s0.useDHCP = false;
            enp4s0.ipv4.addresses = [{
              address = "192.168.18.10";
              prefixLength = 24;
            }];
            enp5s0.useDHCP = false;
            enp5s0.ipv4.addresses = [{
              address = "192.168.18.11";
              prefixLength = 24;
            }];
          };
          firewall.allowedTCPPorts = [ 22 ];
          defaultGateway = "192.168.1.1";
          nameservers = [ "8.8.8.8" ];
        };

        nixpkgs.hostPlatform = "${system}"; 

        services.openssh.enable = true;

        users.users.nixos.openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEJeTUFLvpH1bM7oAKCZK+JTVAYVmEIhZwkgmrgRPHy1 installer_iso_laptop"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIIUOzM+TQDqv8pWZ5m+xO0wVvCL1PL+SBsysCVBXS+q cowe@desktop"
        ];
      }
    ]; 
  };
}
