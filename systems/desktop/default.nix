{ inputs, ... }:

rec {
  system = "x86_64-linux";
  hostname = "desktop";
  stateVersion = "24.11";
  users = [
    (import ../../users/cowe { inherit inputs system; })
  ];
}
