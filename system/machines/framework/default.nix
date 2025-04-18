{ inputs, ... }:

rec { 
  hostname = "framework"; 
  nixpkgs = inputs.nixpkgs;
  stateVersion = "24.11"; 
  system = "x86_64-linux"; 
  overlays = [ ];
  modules = [ 
    ./config.nix 
    ./hardware-configuration.nix
    
    inputs.nixos-hardware.nixosModules.framework-13-7040-amd

    (import ../../../home/users/cowe { inherit inputs nixpkgs system overlays; })
    (import ../../../home/users/cowe/home.nix { inherit inputs stateVersion; })

    inputs.home-manager.nixosModules.home-manager

    ./modules/kanata
  ];
}
