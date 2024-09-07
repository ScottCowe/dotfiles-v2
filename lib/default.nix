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

  mkHost = { hostname, nixpkgs, stateVersion, system, users, additionalModules ? [], overlays ? [] }:
  let
    systemConfiguration = ../system/machines/${hostname}/config.nix;
    hardwareConfiguration = ../system/machines/${hostname}/hardware.nix;
    filesystemConfiguration = ../system/machines/${hostname}/filesystem.nix;

  in nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };

    pkgs = import nixpkgs { inherit system overlays; };
    lib = nixpkgs.lib;

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

  mkHome = { username, homeConfiguration, nixpkgs, additionalModules ? [] }:
  inputs.flake-utils.lib.eachDefaultSystem (system:
    inputs.home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = {};

      pkgs = import nixpkgs { inherit system; };

      modules = [
        homeConfiguration
      ] ++ additionalModules;
    }
  );
}
