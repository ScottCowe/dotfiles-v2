{ inputs, ... }:

rec {
  lib = inputs.nixpkgs.lib;
  nix-colors = inputs.nix-colors;

  mkPCHost = pc.mkPCHost;
  mkPCUser = pc.mkPCUser;

  pc = import ./pc.nix { inherit lib inputs nix-colors mkPCUser; };
}
