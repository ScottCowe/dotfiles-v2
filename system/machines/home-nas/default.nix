{ inputs, ... }:

let 
  nixpkgs = inputs.nixpkgs;
in rec {
  hostname = "home-nas";
  hostId = "4e98920e";
  system = "x86_64-linux";
  stateVersion = "24.11";
  pkgs = nixpkgs.legacyPackages.${system};
  lib = nixpkgs.lib;
  services = [ 
    (import ./services/admin.nix)        
    (import ./services/nextcloud.nix { inherit pkgs; })
    (import ./services/plex.nix)
  ]; 
  networkInterfaces = {
    enp5s0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.1.2";
        prefixLength = 24;
      }];   
    };
  };
  unfreePackages = [
    "nvidia-x11"
    "plexmediaserver"
  ];
  extraConfig = { 
    environment.systemPackages = with pkgs; [ vim git bottom neofetch ];
  }; 
  timezone = "Europe/London";
}
