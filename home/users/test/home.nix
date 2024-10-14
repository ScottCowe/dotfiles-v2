{ inputs, stateVersion, ... }:

let 
  libx = (import ../../../lib { inherit inputs; });
in libx.mkHome {
  username = "test";
  stateVersion = stateVersion;
  modules = [ 
    ./modules/fish.nix
    ./modules/eza.nix 
  ];
} 
