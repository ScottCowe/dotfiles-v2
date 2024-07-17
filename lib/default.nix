{ inputs, ... }:

rec {
  lib = inputs.nixpkgs.lib;
  home-manager = inputs.home-manager;

  user = import ./user.nix { inherit lib home-manager; };
  host = import ./host.nix { inherit lib user home-manager inputs; };
}
