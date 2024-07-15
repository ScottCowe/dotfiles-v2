{
  description = "Version 2 of ScottCowe's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  {
    nixosConfigurations = {
      hp-laptop = (import ./lib { inherit inputs; }).host.mkHost {
        system = "x86_64-linux";
        hostname = "hp-laptop";
        stateVersion = "24.11";
        users = [{
          name = "cowe";
          groups = [ "wheel" "networkmanager" ];
          uid = 1001;
          shell = nixpkgs.legacyPackages."x86_64-linux".zsh;
        }];
      };
    };
  };
}
