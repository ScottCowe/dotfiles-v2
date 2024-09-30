{
  description = "Version 2 of ScottCowe's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-24-05.url = "github:nixos/nixpkgs/nixos-24.05";
    
    flake-utils.url = "github:numtide/flake-utils";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim-flake.url = "github:ScottCowe/nixvim-flake";

    nix-colors.url = "github:misterio77/nix-colors";

    deploy-rs.url = "github:serokell/deploy-rs";
  };

  outputs = { self, ... }@inputs: 
  let
    libx = (import ./lib { inherit inputs; });
  in {
    nixosConfigurations = {
      # PCs
      framework = libx.mkPCHost (import ./system/machines/framework  { inherit inputs; });
      hp-laptop = libx.mkPCHost (import ./system/machines/hp-laptop { inherit inputs; });

      # Servers
      home-nas = libx.mkServerHost (import ./system/machines/home-nas { inherit inputs; });

      # ISOs 
      iso-x86-64 = libx.mkHost (import ./system/machines/iso-x86-64 { inherit inputs; });
    };

    homeConfigurations = {

    };

    deploy.nodes.home-nas = {
      hostname = "192.168.1.2";
      fastConnection = true;
      interactiveSudo = true;
      remoteBuild = true;

      profiles.system = {
        sshUser = "admin";
        path = inputs.deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.home-nas;
        user = "root";
      };
    };
    
    checks = builtins.mapAttrs (system: deployLib: deployLib.deployChecks self.deploy) inputs.deploy-rs.lib;
  };
}
