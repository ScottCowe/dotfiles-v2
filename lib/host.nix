{ lib, user, home-manager, inputs, ... }:

with builtins; {
  mkHost = { system, hostname, stateVersion, users }:
  lib.nixosSystem {
    specialArgs = { inherit inputs; };

    modules = [
      {
        imports = [] ++ (map (u: user.mkSystemUser u) users);

        networking = {
          hostName = "${hostname}";
          networkmanager.enable = true;
        };
        
        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        nixpkgs.config.allowUnfree = true;

        system.stateVersion = "${stateVersion}";
      }

      ../systems/${hostname}
      ../systems/${hostname}/hardware-configuration.nix
      
      home-manager.nixosModules.home-manager

      {
	imports = [] ++ (map (u: user.mkHMUser u) users);
      }
    ]; 
  };
}
