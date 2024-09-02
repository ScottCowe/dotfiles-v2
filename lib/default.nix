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

  mkHost = { hostname, nixpkgs, stateVersion, system, hostType, users, additionalModules, overlays ? [] }:
  let
    systemConfiguration = ../system/machines/${hostname}/config.nix;
    hardwareConfiguration = ../system/machines/${hostname}/hardware.nix;
    filesystemConfiguration = ../system/machines/${hostname}/filesystem.nix;

    pkgs = import nixpkgs { inherit system overlays; };
    lib = nixpkgs.lib;

    isPc = hostType == "pc";
    isServer = hostType == "server";
    isIso = hostType == "iso";
  in nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs pkgs lib; };

    modules = [
      systemConfiguration
      hardwareConfiguration
      filesystemConfiguration
    ] ++ additionalModules;
  };

  mkUser = { username, group ? username, extraGroups, normalUser ? true }: pkgs:
  {
    users.users."${username}" = {
      name = username;
      group = if normalUser then "users" else group;
      isNormalUser = normalUser;
      isSystemUser = !normalUser;
      extraGroups = extraGroups;
      initialPassword = "password";
      shell = pkgs.fish;
    };
  };

  mkHome = { username, homeConfiguration }:
  inputs.home-manager.lib.homeManagerConfiguration {
    extraSpecialArgs = {};

    modules = [
      homeConfiguration
    ];
  };
}
