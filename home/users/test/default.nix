{ inputs, nixpkgs, system, overlays, ... }:

let 
  libx = (import ../../../lib { inherit inputs; });
  pkgs = import nixpkgs { inherit system overlays; };
in libx.mkUser {
  username = "test";
  extraGroups = [ "wheel" "networkmanager" ]; 
} pkgs 
