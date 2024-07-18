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
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  {
    nixosConfigurations = {
      hp-laptop = 
      let
        system = "x86_64-linux";
      in (import ./lib { inherit inputs; }).host.mkHost {
        system = "${system}";
        hostname = "hp-laptop";
        stateVersion = "24.05";
        users = [{
          name = "cowe";
          groups = [ "wheel" "networkmanager" ];
          uid = 1001;
          shell = nixpkgs.legacyPackages."${system}".zsh;
        }];
      };
    };
  };
}
