{ inputs, ... }:

rec {
  nix-colors = inputs.nix-colors;

  pc = import ./pc.nix { inherit inputs nix-colors mkPCUser; };
  iso = import ./iso.nix { inherit inputs; };
  server = import ./server.nix { inherit inputs mkServerService; };

  mkPCHost = pc.mkPCHost;
  mkPCUser = pc.mkPCUser;

  mkISOSystem = iso.mkISOSystem;

  mkServerHost = server.mkServerHost;
  mkServerService = server.mkServerService;

  mkHost = { hostname, nixpkgs, stateVersion, system, hostType, users }:
  let
    systemConfiguration = ../system/machines/${hostname}/config.nix;

    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;

    isPc = hostType == "pc";
    isServer = hostType == "server";
    isIso = hostType == "iso";
  in nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs pkgs lib; };

    modules = [
      systemConfiguration
    ];
  };

  mkUser = { username, groups, configDir }:
  let

  in {

  };
}
