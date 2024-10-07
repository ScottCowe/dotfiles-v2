{ inputs, ... }:

rec { 
  hostname = "hp"; 
  nixpkgs = inputs.nixpkgs;
  stateVersion = "24.11"; 
  system = "x86_64-linux"; 
  overlays = [ ];
  modules = [ 
    ./config.nix 
    ./hardware.nix 
    ./filesystem.nix

    (import ../../../home/users/test { inherit inputs nixpkgs system overlays; })
  ];
}
