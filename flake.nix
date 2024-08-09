{
  description = "Version 2 of ScottCowe's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

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
  };

  outputs = { self, nixpkgs, nix-colors, ... }@inputs: 
  {
    nixosConfigurations = let 
      utils = (import ./lib { inherit inputs; });
    in {
      hp-laptop = utils.mkPCHost (import ./systems/hp-laptop { inherit inputs; });
      desktop = utils.mkPCHost (import ./systems/desktop { inherit inputs; });
      iso-x86-64 = utils.mkISOSystem "x86_64-linux" inputs.nixpkgs;
      home-nas = utils.mkServerHost (import ./systems/home-nas { inherit inputs; });
    };
  };
}
