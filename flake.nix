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

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, ... }@inputs: 
  let
    libx = (import ./lib { inherit inputs; });
  in {
    nixosConfigurations = {
      # PCs
      framework = libx.mkHost (import ./system/machines/framework { inherit inputs; });
      hp = libx.mkHost (import ./system/machines/hp { inherit inputs; });

      # ISOs 
      iso-x86-64 = libx.mkHost (import ./system/machines/iso-x86-64 { inherit inputs; });
    };
  };
}
