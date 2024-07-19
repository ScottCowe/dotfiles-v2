{ inputs, ... }:

rec {
  lib = inputs.nixpkgs.lib;
  home-manager = inputs.home-manager;
  nix-colors = inputs.nix-colors;

  user = import ./user.nix { inherit lib nix-colors; };
  host = import ./host.nix { inherit lib user home-manager inputs nix-colors; };
}
