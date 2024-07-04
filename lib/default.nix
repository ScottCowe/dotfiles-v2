{ lib, ... }:

rec {
  user = import ./user.nix { inherit lib; };
  host = import ./host.nix { inherit lib user; };
}
