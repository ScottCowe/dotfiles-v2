{ inputs, nix-colors, mkPCUser, ... }:

{
  mkPCHost = { system, hostname, stateVersion, pkgs, users, 
    unfreePackages ? [], extraConfig ? {}, timezone ? "Europe/London", 
    locale ? "en_US.UTF-8", consoleFont ? "Lat2-Terminus16", gpuType 
  }:
  pkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };

    modules = [
      {
        imports = [] ++ (map (u: mkPCUser u system stateVersion pkgs) users);

        boot.loader = {
          efi.canTouchEfiVariables = true;
          grub = {
            device = "nodev";
            efiSupport = true;
          };
        };

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

        nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) unfreePackages;

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
  
  mkPCUser = { name, groups, shell, colorScheme, 
    wm, terminal, browser, fileBrowser, 
    unfreePackages ? [], extraConfig ? {}, ... }: system: stateVersion: pkgs:
  {
    users.users."${name}" = {
      name = name;
      isNormalUser = true;
      isSystemUser = false;
      extraGroups = groups;
      initialPassword = "password";
      shell = if shell == "zsh" then pkgs.legacyPackages."${system}".zsh else null;
    };

    home-manager.extraSpecialArgs = {
      inherit name;
    };

    home-manager.users."${name}" = pkgs.lib.mkMerge [
      {
        home.stateVersion = "${stateVersion}";
        home.username = "${name}";
        home.homeDirectory = "/home/${name}";
      
        nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) unfreePackages;
      }

      extraConfig

      {
        imports = [
          inputs.nix-colors.homeManagerModules.default
          ../home
        ];

        config.colorScheme = colorScheme;

        config.tui = pkgs.lib.mkIf (shell == "zsh") {
          zsh.enable = true;
        };

        config.graphical = pkgs.lib.mkIf (wm == "hyprland") {
          hyprland.enable = true;
          wlogout.enable = true;
          waybar.enable = true;
          mako.enable = true;
          rofi.enable = true;
        };
      }
    ];
  };
}
