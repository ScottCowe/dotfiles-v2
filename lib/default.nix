{ inputs, ... }:

rec {
  lib = inputs.nixpkgs.lib;
  nix-colors = inputs.nix-colors;

  pc = import ./pc.nix { inherit lib inputs nix-colors mkPCUser; };
  iso = import ./iso.nix { inherit lib inputs; };

  mkPCHost = pc.mkPCHost;
  mkPCUser = pc.mkPCUser;

  mkISOSystem = iso.mkISOSystem;
}
