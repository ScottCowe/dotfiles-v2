{ inputs, ... }:

rec {
  system = "x86_64-linux";
  hostname = "hp-laptop";
  stateVersion = "24.05";
  pkgs = inputs.nixpkgs;
  gpuType = "intel";
  users = [
    (import ../../../home/users/cowe { inherit inputs system; })
  ];
}
