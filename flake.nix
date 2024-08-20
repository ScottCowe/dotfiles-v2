{
  description = "Version 2 of ScottCowe's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-24-05.url = "github:nixos/nixpkgs/nixos-24.05";
    
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
  {
    nixosConfigurations = let 
      utils = (import ./lib { inherit inputs; });
    in {
      hp-laptop = utils.mkPCHost (import ./systems/hp-laptop { inherit inputs; });
      desktop = utils.mkPCHost (import ./systems/desktop { inherit inputs; });
      iso-x86-64 = utils.mkISOSystem "x86_64-linux" inputs.nixpkgs;
      home-nas = utils.mkServerHost (import ./systems/home-nas { inherit inputs; });
      framework = utils.mkPCHost (import ./systems/framework  { inherit inputs; });
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
