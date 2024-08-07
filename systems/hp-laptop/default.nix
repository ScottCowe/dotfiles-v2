{ inputs, ... }:

rec {
  system = "x86_64-linux";
  hostname = "hp-laptop";
  stateVersion = "24.05";
  pkgs = inputs.nixpkgs;
  users = [
    (import ../../users/cowe { inherit inputs system; })
  ];
}
