{ inputs, ... }:

rec {
  nix-colors = inputs.nix-colors;

  pc = import ./pc.nix { inherit inputs nix-colors mkPCUser; };
  iso = import ./iso.nix { inherit inputs; };
  server = import ./server.nix { inherit inputs mkServerService; };

  mkPCHost = pc.mkPCHost;
  mkPCUser = pc.mkPCUser;

  mkServerHost = server.mkServerHost;
  mkServerService = server.mkServerService;

  mkHost = { hostname, nixpkgs, stateVersion, system, modules ? [], overlays ? [], ...}:
  nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };

    pkgs = import nixpkgs { inherit system overlays; };
    lib = nixpkgs.lib;

    modules = modules;
  };

  
  mkUser = { username, group ? username, extraGroups ? [], normalUser ? true, ... }: pkgs:
  {
    users.users."${username}" = {
      name = username;
      group = if normalUser then "users" else group;
      isNormalUser = normalUser;
      isSystemUser = !normalUser;
      extraGroups = extraGroups;
      initialPassword = "password";
      shell = pkgs.bash;
    };
  };

  mkHome = { username, stateVersion, modules ? [], ... }:
  {
    home-manager.extraSpecialArgs = {
      inherit inputs;
    };	

    home-manager.users."${username}" = {
      home.stateVersion = "${stateVersion}";
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";

      imports = modules;
    };
  };
}
