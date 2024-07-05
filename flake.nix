{
  description = "Version 2 of ScottCowe's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let
    inherit (nixpkgs) lib;
    util = import ./lib { inherit lib; };

    inherit (util) host;

    pkgs = import nixpkgs;
  in {
    nixosConfigurations = {
      hp-laptop = host.mkHost {
        system = "x86_64-linux";
        hostname = "hp-laptop";
        stateVersion = "23.11";
        users = [{
          name = "cowe";
          groups = [ "wheel" "networkmanager" ];
          uid = 1000;
          shell = pkgs.zsh;
        }];
      };
    };
  };
}
