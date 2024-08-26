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

  mkHost = { hostname, nixpkgs, stateVersion, system, hostType, users, additionalModules }:
  let
    systemConfiguration = ../system/machines/${hostname}/config.nix;
    hardwareConfiguration = ../system/machines/${hostname}/hardware.nix;
    filesystemConfiguration = ../system/machines/${hostname}/filesystem.nix;

    pkgs = nixpkgs.legacyPackages.${system};
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

  mkUser = { username, groups, normalUser ? true, userConfiguration }: pkgs:
  {
    users.users."${username}" = {
      name = username;
      isNormalUser = normalUser;
      isSystemUser = !normalUser;
      extraGroups = groups;
      initialPassword = "password";
      shell = pkgs.zsh;
    };
  };

  mkHome = { username, homeConfiguration }:
  inputs.home-manager.lib.homeManagerConfiguration {
    extraSpecialArgs = {};

    modules = [];
  };
}
