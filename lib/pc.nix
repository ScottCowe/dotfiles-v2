{ lib, inputs, nix-colors, mkPCUser, ... }:

{
  mkPCHost = { system, hostname, stateVersion, users, 
    unfreePackages ? [], extraConfig ? {}, timezone ? "Europe/London", locale ? "en_US.UTF-8",
    consoleFont ? "Lat2-Terminus16", gpuType }:
  lib.nixosSystem {
    specialArgs = { inherit inputs; };

    modules = [
      {
        imports = [] ++ (map (u: mkPCUser u stateVersion) users);

        networking = {
          hostName = "${hostname}";
          networkmanager.enable = true;
        };
        
        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        system.stateVersion = "${stateVersion}";

        home-manager.extraSpecialArgs = {
          inherit inputs;
          inherit nix-colors;
          inherit gpuType;
        };	

        nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) unfreePackages;

        i18n.defaultLocale = locale;

        timezone = { 
          enable = true; 
          automatic = false;
          zone = timezone; 
        };

        console = {
          earlySetup = true;
          font = consoleFont; 
          keyMap = "us";
        };
      }

      extraConfig

      ../systems/${hostname}/config.nix
      ../systems/${hostname}/hardware-configuration.nix
      
      inputs.home-manager.nixosModules.home-manager
    ]; 
  };
  
  mkPCUser = { name, groups, uid, shell, colorScheme, ... }: stateVersion: 
  {
    users.users."${name}" = {
      name = name;
      isNormalUser = true;
      isSystemUser = false;
      extraGroups = groups;
      uid = uid;
      initialPassword = "password";
      shell = shell;
    };

    home-manager.users."${name}" = lib.mkMerge [
      {
        home.stateVersion = "${stateVersion}";
        home.username = "${name}";
        home.homeDirectory = "/home/${name}";
      }

      ../users/${name}/home.nix

      {
        imports = [
          inputs.nix-colors.homeManagerModules.default
        ];

        config.colorScheme = colorScheme;
      }
    ];
  };
}
