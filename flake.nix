{
  description = "Version 2 of ScottCowe's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
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

    # nixvim-flake.url = "github:ScottCowe/nixvim-flake";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";

    deploy-rs.url = "github:serokell/deploy-rs";

    stylix.url = "github:danth/stylix";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... }@inputs: 
  let
    libx = (import ./lib { inherit inputs; });
  in {
    nixosConfigurations = {
      # PCs
      framework-old = libx.mkPCHost (import ./system/machines/framework-old  { inherit inputs; });
      framework = libx.mkHost (import ./system/machines/framework { inherit inputs; });
      hp = libx.mkHost (import ./system/machines/hp { inherit inputs; });

      # ISOs 
      iso-x86-64 = libx.mkHost (import ./system/machines/iso-x86-64 { inherit inputs; });
    };

    homeConfigurations = {
      
    };

    deploy.nodes.home-nas = {
      hostname = "100.66.112.52";
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
